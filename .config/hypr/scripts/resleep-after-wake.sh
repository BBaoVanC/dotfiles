#!/bin/sh -x

sleep 15
pidof hyprlock || exit 0 # system was unlocked

case "$HOSTNAME" in
    bobafw)
        systemctl sleep
        ;;
    *)
        hyprctl dispatch dpms off
        ;;
esac

