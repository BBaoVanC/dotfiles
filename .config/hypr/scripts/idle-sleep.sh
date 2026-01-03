#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        systemctl sleep
        ;;
    *)
        ~/.config/hypr/dpms.sh off
        ;;
esac
