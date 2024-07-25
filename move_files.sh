#!/bin/bash

# Function to recursively move folders and files
move_folders_and_files() {
    local source_dir="$1"
    local dest_dir="$2"

    # Move folders and files in the current directory
    for item in "$source_dir"/*; do
        if [ -d "$item" ]; then
            # Move folder
            cd $item
            move_folders_and_files "$item" "$dest_dir"
#            mv "$item" "$dest_dir"
        elif [ -f "$item" ]; then
            # Move file
            mv "$item" "$dest_dir"
        fi
    done
}

# Check if the user provided source and destination directories
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Check if the source directory exists
if [ ! -d "$1" ]; then
    echo "Source directory '$1' not found."
    exit 1
fi

# Check if the destination directory exists
if [ ! -d "$2" ]; then
    echo "Destination directory '$2' not found."
    exit 1
fi

# Move folders and files recursively
echo "Moving folders and files from '$1' to '$2'..."
move_folders_and_files "$1" "$2"
echo "Move completed."

