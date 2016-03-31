#!/bin/sh
wmctrl -l | cut -d " " -f 1,2,3,4 --complement | dmenu -i -p "Choose window: " | xargs -d "\n"  wmctrl -a
