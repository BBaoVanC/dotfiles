#!/bin/sh

map=$(setxkbmap -print | awk -F+ '/xkb_symbols/ {print $2}')

case $map in
    "us")
        setxkbmap -layout us -variant altgr-intl && sigdwmblocks 2
        ;;
    "us(altgr-intl)")
        setxkbmap -layout us && sigdwmblocks 2
        ;;
esac
