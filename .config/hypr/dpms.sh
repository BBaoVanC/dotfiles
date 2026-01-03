#!/bin/sh -x

case "$XDG_CURRENT_DESKTOP-$1" in
	"Hyprland-on")
		hyprctl dispatch dpms on
		;;
	"Hyprland-off")
		hyprctl dispatch dpms off
		;;
	"niri-on")
		niri msg action power-on-monitors
		;;
	"niri-off")
		niri msg action power-off-monitors
		;;

	*)
		echo "Usage: $0 [on/off]"
		;;
esac
