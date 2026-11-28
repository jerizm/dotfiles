#!/bin/bash

LABEL=$(~/dotfiles/herdr/claude-usage.sh)
sketchybar --set "$NAME" label="${LABEL:-?}"
