#!/bin/bash

# Array of directory and file names
files=("directory1" "file1.txt" "directory2")

# Loop through array
for file in "${files[@]}"
do
  # Check if file or directory exists
  if [ ! -e "$file" ]
  then
    # Create file or directory
    mkdir -p "$file"
    echo "Created $file"
  else
    echo "$file already exists"
  fi
done