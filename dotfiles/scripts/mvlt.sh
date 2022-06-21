#!/bin/sh
# move latest telegram download

downloads_dir="$HOME/Downloads/Telegram Desktop"

filename=$(ls --sort=time -F "$downloads_dir" | sed '/\// d' | head -n 1)

mv "$downloads_dir/$filename" "$(pwd)"
