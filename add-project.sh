#!/bin/bash

# Function to show usage
usage() {
    echo "Usage: $0 --name <name> --dir <dir>"
    exit 1
}

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --name) NAME="$2"; shift ;;
        --dir) DIR="$2"; shift ;;
        *) usage ;;
    esac
    shift
done

# Prompt for missing arguments
if [ -z "$NAME" ]; then
    read -p "Enter project name: " NAME
fi
if [ -z "$DIR" ]; then
    read -p "Enter project directory: " DIR
fi

# Create directory if it doesn't exist
mkdir -p "projects/$DIR"

# Create the .mdx file
FILE_PATH="projects/$DIR/$NAME.mdx"
touch "$FILE_PATH"

# Print the line to add in docs.json
echo "add this in docs.json"
echo "\"$FILE_PATH\""