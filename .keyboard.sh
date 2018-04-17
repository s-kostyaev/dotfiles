#!/bin/bash

setxkbmap -option
setxkbmap -option ctrl:nocaps
setxkbmap "us,ru" ",winkeys" "grp:win_space_toggle,grp_led:caps"
# killall -9 xcape
# ~/reconfig-kbd
# ~/space2hyper
# ~/enter2control

xset r rate 200 60
xset -b

HANDLER_ENG="CAPSLOCK"
HANDLER_RUS="RIGHTSHIFT"
if grep -q "Razer" /proc/bus/input/devices; then
    KEYBOARD="razer"
elif grep -q "HID 04f3:0103" /proc/bus/input/devices; then
    KEYBOARD="HID 04f3:0103"
else
    KEYBOARD="keyboard"
fi

sudo pkill shift-shift
sudo shift-shift -quiet=true \
    -match "$KEYBOARD" -first "$HANDLER_ENG" -second "$HANDLER_RUS" &
