#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        # nothing to do after wake
        ;;
    *)
        hyprctl dispatch dpms on
        ;;
esac
