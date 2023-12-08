#!/bin/bash

# checks if file/program is open, doesn't open again and switches to
# only use for programs where you want just one open e.g. spotify

program_name="$1"

if pgrep -x "$program_name" > /dev/null
then
    wmctrl -a "$program_name"
else
    "$program_name" &
fi
