#!/bin/sh
echo "$SRANDRD_ACTION"
case "$SRANDRD_ACTION" in
    # "DVI-0 connected") xrandr --output DVI-0 --auto --right-of LVDS;;
    # "VGA-0 connected") xrandr --output VGA-0 --auto --left-of LVDS;;
    "VGA-1 disconnected") xrandr --output LVDS-1 --mode 1366x768 --pos 0x0 --output VGA-1 --off;;
    "VGA-1 connected") xrandr --output LVDS-1 --mode 1366x768 --pos 0x0 --output VGA-1 --mode 1440x900 --pos 1366x0;;
esac
