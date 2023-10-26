#!/bin/bash

# Check if the number of arguments is not equal to 2
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required - filesdir and searchstr"
    exit 1
fi

# Assign the first argument to 'filesdir' and the second argument to 'searchstr'
filesdir="$1"
searchstr="$2"

# Check if 'filesdir' is not a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory"
    exit 1
fi

# Search for the 'searchstr' in files within 'filesdir' and its subdirectories
file_count=$(find "$filesdir" -type f | wc -l)
match_count=0

# Loop through the files and search for the string
find "$filesdir" -type f -print0 | while IFS= read -r -d '' file; do
    if grep -q "$searchstr" "$file"; then
        match_count=$((match_count + 1))
    fi
done

# Print the results
echo "The number of files are $file_count and the number of matching lines are $match_count"
