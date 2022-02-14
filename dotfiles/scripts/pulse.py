#!/bin/env python3 -u

from os import system, popen
from re import search

# to make pulseaudio start and show the module on startup
# instead of waiting for a client to connect
system("pamixer --get-volume >/dev/null")

while system("pgrep -x pulseaudio >/dev/null") == 0:

    active_port = popen("pacmd list-sinks | awk '/\*/ {getline; print;}'").read()
    interface = search("analog|hdmi", active_port)

    mute = popen("pamixer --get-mute").read()
    volume = popen("pamixer --get-volume").read()

    mute = mute[:-1]
    volume = volume[:-1]

    if interface.group(0) == "hdmi":
        if mute == "false":
            print(" " + volume + "%")
        else:
            print(" " + volume + "%")
    else:
        print(" " + volume + "%")
