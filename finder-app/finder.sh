#!/bin/bash

# Assign the command line arguments to variables
filesdir=$1
searchstr=$2

# Check if the correct number of arguments is not given
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required: 1) directory path, 2) search string"
    exit 1
fi

# Check if the first argument is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: The specified directory does not exist"
    exit 1
fi

# Count the number of files in the directory and subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines within these files
num_matches=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $num_matches"

