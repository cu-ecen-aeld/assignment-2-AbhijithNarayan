#!/bin/sh

# Check if the number of arguments is not equal to 2
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required - writefile and writestr"
    exit 1
fi

# Assign the first argument to 'writefile' and the second argument to 'writestr'
writefile="$1"
writestr="$2"

# Get the directory part of the path
dirpath=$(dirname "$writefile")

# Create the directory path if it doesn't exist
if [ ! -d "$dirpath" ]; then
    if ! mkdir -p "$dirpath"; then
        echo "Error: Unable to create the directory path '$dirpath'"
        exit 1
    fi
fi

# Use echo to write the content to 'writefile', creating the path if it doesn't exist
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Unable to create or write to '$writefile'"
    exit 1
fi

# Print a success message
echo "File '$writefile' created and written successfully."
