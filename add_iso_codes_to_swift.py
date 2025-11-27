#!/usr/bin/env python3
"""
Add ISO codes to Country() calls in FlagData.swift
"""

import re
from generate_iso_codes import get_iso_code

SWIFT_FILE = "Tapaterra/Models/FlagData.swift"

def main():
    with open(SWIFT_FILE, "r") as f:
        content = f.read()

    # Pattern to match Country(name: "...", imageName: "...", continent: ...)
    pattern = r'Country\(name: "([^"]+)", imageName: "([^"]+)", continent: (\.\w+)\)'

    def replace_match(match):
        country_name = match.group(1)
        image_name = match.group(2)
        continent = match.group(3)
        iso_code = get_iso_code(country_name)
        return f'Country(name: "{country_name}", imageName: "{image_name}", continent: {continent}, isoCode: "{iso_code}")'

    updated_content = re.sub(pattern, replace_match, content)

    with open(SWIFT_FILE, "w") as f:
        f.write(updated_content)

    print(f"Updated {SWIFT_FILE} with ISO codes")

if __name__ == "__main__":
    main()

