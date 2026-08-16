#!/bin/sh

# Adapted from .config/hypr/scripts/idle-sleep.sh
case "$HOSTNAME" in
	bobafw)
		systemctl sleep
		;;
	*)
		# don't sleep on my desktops; only turn off screen (which is an earlier event)
		;;
esac
