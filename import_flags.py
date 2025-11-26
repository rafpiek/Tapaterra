import os
import shutil
import json

# Configuration
SOURCE_DIR = "/Users/rafal/indie/flags/assets/flags"
DEST_DIR = os.path.abspath("Tapaterra/Assets.xcassets/Flags")
USE_SIZE = "large"  # 'large', 'medium', or 'small'

def create_contents_json(is_folder=False, provides_namespace=False):
    data = {
        "info": {
            "author": "xcode",
            "version": 1
        }
    }
    if is_folder:
        data["properties"] = {
            "provides-namespace": provides_namespace
        }
    return json.dumps(data, indent=2)

def create_imageset_contents_json(filename):
    data = {
        "images": [
            {
                "filename": filename,
                "idiom": "universal",
                "scale": "1x"
            }
        ],
        "info": {
            "author": "xcode",
            "version": 1
        }
    }
    return json.dumps(data, indent=2)

def main():
    # 1. Create root Flags folder in Assets
    if os.path.exists(DEST_DIR):
        shutil.rmtree(DEST_DIR)
    os.makedirs(DEST_DIR)

    # Write root Contents.json with namespace=True (so we use "Flags/country")
    with open(os.path.join(DEST_DIR, "Contents.json"), "w") as f:
        f.write(create_contents_json(is_folder=True, provides_namespace=True))

    print(f"Created root Flags folder at {DEST_DIR}")

    # 2. Walk source directory
    # Structure is region/size/image.png
    # We want to flatten regions? Or keep them as folders for organization?
    # Let's keep regions as folders for organization in Xcode, but NOT namespace them
    # so we can stick to Image("Flags/country") instead of Image("Flags/Africa/country")
    # unless duplicate names exist.

    regions = [d for d in os.listdir(SOURCE_DIR) if os.path.isdir(os.path.join(SOURCE_DIR, d))]

    for region in regions:
        region_path = os.path.join(SOURCE_DIR, region)
        size_path = os.path.join(region_path, USE_SIZE)

        if not os.path.exists(size_path):
            continue

        # Create region folder in Assets (just for organization, no namespace)
        dest_region_path = os.path.join(DEST_DIR, region.capitalize())
        os.makedirs(dest_region_path, exist_ok=True)

        with open(os.path.join(dest_region_path, "Contents.json"), "w") as f:
            f.write(create_contents_json(is_folder=True, provides_namespace=False))

        # Process images
        images = [f for f in os.listdir(size_path) if f.endswith(".png")]

        for image_file in images:
            country_name = os.path.splitext(image_file)[0]
            # Convert to consistent naming if needed, but source is already kebab-case.
            # Keeping kebab-case is fine for asset keys.

            imageset_name = f"{country_name}.imageset"
            imageset_path = os.path.join(dest_region_path, imageset_name)
            os.makedirs(imageset_path, exist_ok=True)

            # Copy file
            shutil.copy(
                os.path.join(size_path, image_file),
                os.path.join(imageset_path, image_file)
            )

            # Write Contents.json
            with open(os.path.join(imageset_path, "Contents.json"), "w") as f:
                f.write(create_imageset_contents_json(image_file))

    print("Done importing flags.")

if __name__ == "__main__":
    main()

