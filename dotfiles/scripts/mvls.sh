#!/bin/sh
# move latest screenshot

screenshots_dir="$HOME/Pictures/Screenshots"

filename=$(ls --sort=time -F $screenshots_dir | sed '/\// d' | head -n 1)

mv "$screenshots_dir/$filename" "$(pwd)"
