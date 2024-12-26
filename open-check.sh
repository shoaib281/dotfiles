#!/bin/bash

# Script to open or switch to a program or file
# Works with programs and file paths

input="$1"

# Function to open or switch to a program
open_program() {
    local program_name="$1"
    if pgrep -x "$program_name" > /dev/null; then
        wmctrl -a "$program_name"
    else
        "$program_name" &
    fi
}

# Function to open a file with its default application
open_file() {
    local file_path="$1"
    local file_name
    file_name=$(basename "$file_path")

    # Check if the file is already open by searching window titles
    if wmctrl -l | grep -q "$file_name"; then
        wmctrl -a "$file_name"
    else
        xdg-open "$file_path" &
    fi
}

# Check if the input is a file
if [ -f "$input" ]; then
    open_file "$input"
else
    # Assume it's a program name
    open_program "$input"
fi

