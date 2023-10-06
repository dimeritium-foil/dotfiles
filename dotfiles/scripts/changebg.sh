#!/bin/sh

bg_name=$(tail -1 ~/.fehbg | cut -d" " -f 4)

i=1
while [[ ${bg_name: -1} != "'" ]]; do
    bg_name="${bg_name} $(tail -1 ~/.fehbg | cut -d" " -f $((4+$i)))"
    ((i++))
done

feh --bg-fill $bg_name
echo $bg_name
