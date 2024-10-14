#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        systemctl suspend-then-hibernate
        ;;
    *)
        # do nothing on my desktops
        ;;
esac
