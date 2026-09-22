#!/bin/bash

CPUICON=🖥️

sketchybar --add item cpu_usage right \
    --set cpu_usage icon=$CPUICON script="sketchybar --set cpu_usage label=\$CPU_USAGE" \
    --subscribe cpu_usage system_stats
