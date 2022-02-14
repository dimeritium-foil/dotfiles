#!/bin/sh

strings=(low-E A D G B high-E)
clear

while true
do
    rand=$(shuf -i 0-5 -n 1)
    figlet -f 3d ${strings[$rand]} | lolcat
    sleep ${1:-2}
    clear
done
