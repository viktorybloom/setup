#!/bin/sh
# Times the screen off and puts it to background
swayidle -w \
    timeout 300 'swaymsg "output * power off"' \
    resume 'swaymsg "output * power on"' &

swaylock -C ~/.config/swaylock/config

kill%%


