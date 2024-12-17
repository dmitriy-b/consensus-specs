#!/bin/bash

# Function to rename directories
rename_directories() {
    find . -type d -name "minimal" \
        -not -path "./venv/*" \
        -not -path "./docs/*" \
        -not -path "./.history/*" \
        -not -path "./scripts/*" \
        -not -path "./.github/workflows/*" \
        -not -path "./.pytest_cache/*" \
        -not -path "./.circleci/*" \
        -not -path "./tests/core/pyspec/eth2spec/utils/test_merkle_minimal.py" \
        -not -path "./venv" \
        -not -path "./docs" \
        -not -path "./.history" \
        -not -path "./.github/workflows" \
        -not -path "./.pytest_cache" \
        -not -path "./.circleci" \
        | while read dir; do
        newdir=$(echo "$dir" | sed 's/minimal/gnosis/g')
        mv "$dir" "$newdir"
        echo "Renamed directory: $dir -> $newdir"
    done
}

# Function to replace content in files
replace_in_files() {
    # Exclude .git directory, binary files, and specified directories
    find . -type f \
        -not -path "./.git/*" \
        -not -path "./venv/*" \
        -not -path "./docs/*" \
        -not -path "./.history/*" \
        -not -path "./scripts/*" \
        -not -path "./.github/workflows/*" \
        -not -path "./.pytest_cache/*" \
        -not -path "./.circleci/*" \
        -not -path "./tests/core/pyspec/eth2spec/utils/test_merkle_minimal.py" \
        -not -name "*.pyc" \
        -not -name "*.pyo" \
        -not -name "*.so" \
        -not -name "*.dylib" \
        -not -name "*.dll" \
        -not -name "*.class" \
        | while read file; do
        if [ -f "$file" ]; then
            # Check if file is binary
            if file "$file" | grep -q "text"; then
                # Create a temporary file
                temp_file=$(mktemp)
                sed 's/minimal/gnosis/g' "$file" > "$temp_file"
                mv "$temp_file" "$file"
                echo "Processed file: $file"
            fi
        fi
    done
}

echo "Starting replacement process..."
echo "Step 1: Renaming directories..."
rename_directories

echo "Step 2: Replacing content in files..."
replace_in_files

echo "Replacement process completed!" 