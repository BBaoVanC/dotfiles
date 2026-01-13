#!/bin/sh -x

case "$HOSTNAME" in
    bobafw)
        # nothing to do after wake
        ;;
    *)
        # nothing to do as not even sleeping the desktops in the first place
        ;;
esac
