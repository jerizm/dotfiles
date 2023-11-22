BATTERY=(
  update_freq=1
  icon.font="$ICON_FONT:Regular:15.0"
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right
sketchybar --set battery "${BATTERY[@]}"

