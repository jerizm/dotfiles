#!/usr/bin/env sh

FRONT_APP_SCRIPT='sketchybar --set $NAME label="$INFO"'

FOCUS=(
  script="$FRONT_APP_SCRIPT"
  icon.drawing=off
  background.padding_left=18
  background.padding_right=10
  associated_display=active
)

sketchybar --add event window_focus
sketchybar --add event windows_on_spaces

sketchybar --add item focus center
sketchybar --set focus "${FOCUS[@]}"
sketchybar --subscribe focus front_app_switched

