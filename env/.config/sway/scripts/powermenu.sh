#!/bin/bash

lock_file="/tmp/wofi_lock"

if [ -e "$lock_file" ]; then
  echo "wofi is already running. Exiting."
  exit 1
fi

# Create lock file
touch "$lock_file"

entries="\uf023  Logout\n\uf4ee  Suspend\n\uead2  Reboot\n\u23fb  Poweroff"

selected=$(echo -e "$entries" | wofi --width 200 --height 240 --dmenu \
  --cache-file /dev/null \
  --font "UbuntuMono Nerd Font 20" \
  --padding 20 \
  --lines 6 | awk '{print tolower($2)}')

# Delay for two seconds
sleep 2

# Remove lock file
rm "$lock_file"

case $selected in
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff;;
    # it used to be poweroff -i
esac

