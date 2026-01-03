#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        # nothing to do after wake
        ;;
    *)
        ~/.config/hypr/dpms.sh on
        ;;
esac
