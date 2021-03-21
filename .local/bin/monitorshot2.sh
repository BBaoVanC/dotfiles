#!/bin/bash

# Modified version of
# https://gist.github.com/naelstrof/f9b74b5221cdc324c0911c89a47b8d97

MONITORS=$(xrandr | grep -o '[0-9]*x[0-9]*[+-][0-9]*[+-][0-9]*')
# Get the location of the mouse
XMOUSE=$(xdotool getmouselocation | awk -F "[: ]" '{print $2}')
YMOUSE=$(xdotool getmouselocation | awk -F "[: ]" '{print $4}')

for mon in ${MONITORS}; do
  # Parse the geometry of the monitor
  MONW=$(echo ${mon} | awk -F "[x+]" '{print $1}')
  MONH=$(echo ${mon} | awk -F "[x+]" '{print $2}')
  MONX=$(echo ${mon} | awk -F "[x+]" '{print $3}')
  MONY=$(echo ${mon} | awk -F "[x+]" '{print $4}')
  # Use a simple collision check
  if (( ${XMOUSE} >= ${MONX} )); then
    if (( ${XMOUSE} <= ${MONX}+${MONW} )); then
      if (( ${YMOUSE} >= ${MONY} )); then
        if (( ${YMOUSE} <= ${MONY}+${MONH} )); then
          # We have found our monitor!
          maim -u -g "${MONW}x${MONH}+${MONX}+${MONY}" | xclip -sel c -t image/png
          notify-send "Screenshot taken" "Current monitor saved to clipboard"
          exit 0
        fi
      fi
    fi
  fi
done
echo "Oh no the mouse is in the void!"
exit 1
