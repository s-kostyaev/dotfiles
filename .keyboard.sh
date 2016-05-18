#!/bin/bash

#setxkbmap -option ctrl:nocaps
#setxkbmap "us,ru" ",winkeys" "grp:toggle,grp_led:caps"
killall -9 xcape
./reconfig-kbd
./space2hyper
