#!/usr/bin/env python3
"""Generate all required app icon sizes from tapaterra.png"""

from PIL import Image
import os

SOURCE_IMAGE = "../tapaterra.png"
OUTPUT_DIR = "Tapaterra/Assets.xcassets/AppIcon.appiconset"

# Icon sizes needed: (filename, size_in_pixels)
ICONS = [
    # iOS - single 1024x1024 (Xcode generates the rest)
    ("icon-1024.png", 1024),

    # macOS icons
    ("icon-16.png", 16),
    ("icon-16@2x.png", 32),
    ("icon-32.png", 32),
    ("icon-32@2x.png", 64),
    ("icon-128.png", 128),
    ("icon-128@2x.png", 256),
    ("icon-256.png", 256),
    ("icon-256@2x.png", 512),
    ("icon-512.png", 512),
    ("icon-512@2x.png", 1024),
]

def generate_icons():
    # Open source image
    img = Image.open(SOURCE_IMAGE)

    # Ensure output directory exists
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    for filename, size in ICONS:
        output_path = os.path.join(OUTPUT_DIR, filename)
        resized = img.resize((size, size), Image.Resampling.LANCZOS)
        resized.save(output_path, "PNG")
        print(f"Generated: {output_path} ({size}x{size})")

    print(f"\nDone! Generated {len(ICONS)} icons.")

if __name__ == "__main__":
    generate_icons()

