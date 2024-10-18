#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        brightnessctl -s set 1
        ;;
    *)
        # my desktops don't have brightness
        ;;
esac
