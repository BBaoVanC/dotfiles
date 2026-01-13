#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        systemctl sleep
        ;;
    *)
        # don't sleep my desktops, only turn off screen
        ;;
esac
