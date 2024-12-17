#!/bin/bash

# Check if source Makefile exists
if [ -f "scripts/Makefile" ]; then
    echo "Backing up original Makefile..."
    if [ -f "Makefile" ]; then
        mv Makefile Makefile.backup
        echo "Original Makefile backed up as Makefile.backup"
    fi

    echo "Copying scripts/Makefile to repository root..."
    cp scripts/Makefile ./
    echo "Makefile replaced successfully."
else
    echo "Error: scripts/Makefile not found."
    exit 1
fi

echo "Replacement process completed!"

# Show the new Makefile
echo "Contents of new Makefile:"
ls -la Makefile 