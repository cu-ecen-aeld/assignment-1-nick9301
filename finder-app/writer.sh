#!/bin/bash

# Assign the command line arguments to variables
writefile=$1
writestr=$2

# Check if the correct number of arguments is not given
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required: 1) file path, 2) string to write"
    exit 1
fi

# Create the directory path if it doesn't exist
dirpath=$(dirname "$writefile")
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create the directory path $dirpath"
        exit 1
    fi
fi

# Write the string to the file, creating or overwriting the file
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Failed to write to the file $writefile"
    exit 1
fi

