#!/bin/sh

# Adapted from .config/hypr/scripts/idle-sleep.sh
case "$HOSTNAME" in
	bobafw)
		systemctl sleep
		;;
	*)
		loginctl lock-session
		;;
esac
