#!/usr/bin/env sh

DISKICON=􀤂

sketchybar --add item disk_usage right \
    --set disk_usage icon=$DISKICON script="sketchybar --set disk_usage label=\$DISK_USAGE" \
    --subscribe disk_usage system_stats
