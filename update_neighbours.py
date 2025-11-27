#!/usr/bin/env python3
"""Update neighbours in existing country_details.json"""

import json
import urllib.request
import time

JSON_FILE = "country_details.json"
REST_COUNTRIES_BASE = "https://restcountries.com/v3.1"

def get_neighbour_names(iso3_codes):
    """Convert ISO alpha-3 codes to country names."""
    names = []
    for iso3 in iso3_codes:
        try:
            url = f"{REST_COUNTRIES_BASE}/alpha/{iso3.lower()}"
            req = urllib.request.Request(url)
            with urllib.request.urlopen(req, timeout=5) as response:
                data = json.loads(response.read().decode())
                if isinstance(data, list) and len(data) > 0:
                    country_data = data[0]
                else:
                    country_data = data
                if "name" in country_data and "common" in country_data["name"]:
                    names.append(country_data["name"]["common"])
            time.sleep(0.05)
        except Exception as e:
            print(f"Error fetching {iso3}: {e}")
    return names

def main():
    with open(JSON_FILE, "r", encoding="utf-8") as f:
        data = json.load(f)

    # Get all ISO codes
    iso_to_alpha3 = {}
    for iso_code in data.keys():
        try:
            url = f"{REST_COUNTRIES_BASE}/alpha/{iso_code.lower()}"
            req = urllib.request.Request(url)
            with urllib.request.urlopen(req, timeout=5) as response:
                country_data = json.loads(response.read().decode())
                if isinstance(country_data, list):
                    country_data = country_data[0]
                if "cca3" in country_data:
                    iso_to_alpha3[iso_code] = country_data["cca3"]
            time.sleep(0.05)
        except Exception as e:
            print(f"Error fetching alpha-3 for {iso_code}: {e}")

    # Update neighbours for each country
    updated = 0
    for iso_code, details in data.items():
        if details.get("neighbours"):
            continue  # Skip if already has neighbours

        try:
            url = f"{REST_COUNTRIES_BASE}/alpha/{iso_code.lower()}"
            req = urllib.request.Request(url)
            with urllib.request.urlopen(req, timeout=5) as response:
                country_data = json.loads(response.read().decode())
                if isinstance(country_data, list):
                    country_data = country_data[0]

                borders = country_data.get("borders", [])
                if borders:
                    neighbour_names = get_neighbour_names(borders)
                    details["neighbours"] = neighbour_names
                    updated += 1
                    print(f"Updated {details.get('isoCode', iso_code)}: {len(neighbour_names)} neighbours")
            time.sleep(0.1)
        except Exception as e:
            print(f"Error updating {iso_code}: {e}")

    # Save updated JSON
    with open(JSON_FILE, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)

    print(f"\nUpdated {updated} countries with neighbours")

if __name__ == "__main__":
    main()

