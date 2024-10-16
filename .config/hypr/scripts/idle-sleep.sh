#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        systemctl sleep
        ;;
    *)
        # do nothing on my desktops
        ;;
esac
