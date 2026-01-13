#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        brightnessctl -r
        ;;
    *)
        ~/.config/hypr/dpms.sh on
        ;;
esac
