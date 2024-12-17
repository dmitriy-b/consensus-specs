#!/bin/bash

# Create presets/gnosis directory if it doesn't exist
mkdir -p presets/gnosis

# Copy files from ethereum specs
if [ -d "scripts/specs_ethereum/presets/gnosis" ]; then
    echo "Copying files from scripts/specs_ethereum/presets/gnosis..."
    cp -r scripts/specs_ethereum/presets/gnosis/* presets/gnosis/
    echo "Ethereum specs copied successfully."
else
    echo "Warning: Directory scripts/specs_ethereum/presets/gnosis not found."
fi

# Copy files from gnosis specs
if [ -d "scripts/specs_gnosis/presets/gnosis" ]; then
    echo "Copying files from scripts/specs_gnosis/presets/gnosis..."
    cp -r scripts/specs_gnosis/presets/gnosis/* presets/gnosis/
    echo "Gnosis specs copied successfully."
else
    echo "Warning: Directory scripts/specs_gnosis/presets/gnosis not found."
fi

echo "Copy process completed!"

# List the contents of the destination directory
echo "Contents of presets/gnosis directory:"
ls -la presets/gnosis/ 