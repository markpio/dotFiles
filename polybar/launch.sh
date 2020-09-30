#!/usr/bin/env bash


killall -q polybar

echo "---" | tee -a /tmp/polybar.log

if type xrandr "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload example &
    done
else
    polybar example >>/tmp/polybar.log 2>&1 &
fi

