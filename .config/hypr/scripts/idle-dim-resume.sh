#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        brightnessctl -r
        ;;
    *)
        # no brightness
        ;;
esac
