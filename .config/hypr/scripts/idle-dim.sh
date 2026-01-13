#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        brightnessctl -s set 1
        ;;
    *)
        ~/.config/hypr/dpms.sh off
        ;;
esac
