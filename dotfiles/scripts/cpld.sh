#!/bin/sh
# copy latest download

downloads_dir="$HOME/Downloads"

filename=$(ls --sort=time -F $downloads_dir | sed '/\// d' | head -n 1)

cp "$downloads_dir/$filename" "$(pwd)"
