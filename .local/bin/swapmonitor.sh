#!/bin/sh

while true; do
    usage=$(free | grep Swap: | awk '{print $3}')
    echo "$(date): using $usage bytes of swap" >> $XDG_CACHE_HOME/swapmonitor.txt
    echo "Current swap usage is $usage bytes. Wrote this to $XDG_CACHE_HOME/swapmonitor.txt"
    sleep 10
done
