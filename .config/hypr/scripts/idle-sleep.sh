#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        systemctl sleep
        ;;
    *)
        hyprctl dispatch dpms off
        ;;
esac
