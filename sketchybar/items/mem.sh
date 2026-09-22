#!/usr/bin/env sh

MEMICON=􀫦

sketchybar -m --add item ram_usage right \
    --set ram_usage icon=$MEMICON script="sketchybar --set ram_usage label=\$RAM_USAGE" \
    --subscribe ram_usage system_stats
