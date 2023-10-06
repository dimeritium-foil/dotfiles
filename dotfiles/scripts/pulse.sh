#!/bin/sh

# to make pulseaudio start and show the module on startup
# instead of waiting for a client to connect
pamixer --get-volume &> /dev/null 

while ( pgrep -x pulseaudio &> /dev/null ); do

    active_port="$(pacmd list-sinks | awk '/\*/ {getline; print;}')"
    
    echo " $(pamixer --get-volume)%"
done
