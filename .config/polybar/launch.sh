#!/bin/bash
killall polybar
#export MONITOR=$(polybar --list-monitors 2>/dev/null | cut -f1 -d':'| head -n 1)
#export MONITOR2=$(polybar --list-monitors 2>/dev/null | cut -f1 -d':' | tail -n 2 | head -n1 | grep -vE ^$MONITOR$)
#export WIRELESS=$(ip link | cut -f2 -d':' | grep wl | tr -d ' ' | head -n 1)
#export WIRELESS2=$(ip link | cut -f2 -d':' | grep wl | tr -d ' ' | tail -n 1 | grep -vE ^$WIRELESS$)
#export WIRED=$(ip link | cut -f2 -d':' | grep en | tr -d ' ' | head -n 1)
#export WIRED2=$(ip link | cut -f2 -d':' | grep en | tr -d ' ' | tail -n 1 | grep -vE ^$WIRED$)
polybar top -r