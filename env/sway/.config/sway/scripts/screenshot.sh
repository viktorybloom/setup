#!/bin/bash
 
entries="\ueb89  Active\n\ueb4c  Screen\n\uf061  Output\n\uf1fe  Area\n\ueb7f  Window"
 
selected=$(echo -e "$entries" | wofi --width 200 --height 240 --dmenu \
  --cache-file /dev/null \
  --font "UbuntuMono Nerd Font 20" \
  --padding 20 \
  --lines 7 | awk '{print tolower($2)}')

case $selected in
  active)
    ~/.config/sway/scripts/grimshot --notify save active;;
  screen)
    ~/.config/sway/scripts/grimshot --notify save screen;;
  output)
    ~/.config/sway/scripts/grimshot --notify save output;;
  area)
    ~/.config/sway/scripts/grimshot --notify save area;;
  window)
    ~/.config/sway/scripts/grimshot --notify save window;;
esac
