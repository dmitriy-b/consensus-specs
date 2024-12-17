#!/bin/bash

# Check if source directory exists
if [ -d "scripts/specs_gnosis/configs" ]; then
    echo "Copying files from scripts/specs_gnosis/configs..."
    cp -r scripts/specs_gnosis/configs/* configs/
    echo "Gnosis configs copied successfully."
else
    echo "Error: Directory scripts/specs_gnosis/configs not found."
    exit 1
fi

echo "Copy process completed!"

# List the contents of the destination directory
echo "Contents of configs directory:"
ls -la configs/ 