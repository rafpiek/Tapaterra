#!/usr/bin/env python3
"""Update neighbours in existing country_details.json - optimized version"""

import json
import urllib.request
import time

JSON_FILE = "country_details.json"
REST_COUNTRIES_BASE = "https://restcountries.com/v3.1"

# Cache for ISO3 to name mapping
iso3_to_name_cache = {}

def get_country_name_from_iso3(iso3):
    """Get country name from ISO alpha-3 code, with caching."""
    if iso3 in iso3_to_name_cache:
        return iso3_to_name_cache[iso3]

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
                name = country_data["name"]["common"]
                iso3_to_name_cache[iso3] = name
                return name
    except Exception as e:
        print(f"  Warning: Could not fetch name for {iso3}: {e}")
    return None

def get_neighbour_names(iso3_codes):
    """Convert ISO alpha-3 codes to country names."""
    names = []
    for iso3 in iso3_codes:
        name = get_country_name_from_iso3(iso3)
        if name:
            names.append(name)
        time.sleep(0.03)  # Reduced delay
    return names

def main():
    print("Loading existing country data...")
    with open(JSON_FILE, "r", encoding="utf-8") as f:
        data = json.load(f)

    total = len(data)
    updated = 0
    skipped = 0

    print(f"Processing {total} countries...\n")

    for idx, (iso_code, details) in enumerate(data.items(), 1):
        # Skip if already has neighbours
        if details.get("neighbours"):
            skipped += 1
            continue

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
                    country_name = details.get("capital", iso_code) or iso_code
                    print(f"[{idx}/{total}] {iso_code}: {len(neighbour_names)} neighbours ({', '.join(neighbour_names[:3])}{'...' if len(neighbour_names) > 3 else ''})")
                else:
                    # No borders (island countries, etc.)
                    details["neighbours"] = []
                    print(f"[{idx}/{total}] {iso_code}: No borders")

            # Save periodically (every 10 countries)
            if updated % 10 == 0:
                with open(JSON_FILE, "w", encoding="utf-8") as f:
                    json.dump(data, f, indent=2, ensure_ascii=False)
                print(f"  (Saved progress: {updated} countries updated)")

            time.sleep(0.05)  # Small delay between requests

        except Exception as e:
            print(f"[{idx}/{total}] Error updating {iso_code}: {e}")

    # Final save
    print("\nSaving final data...")
    with open(JSON_FILE, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)

    print(f"\n✓ Complete!")
    print(f"  Updated: {updated} countries")
    print(f"  Skipped: {skipped} countries (already had neighbours)")
    print(f"  Total: {total} countries")

if __name__ == "__main__":
    main()

