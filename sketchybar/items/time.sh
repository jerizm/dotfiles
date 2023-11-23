TIME=(
  update_freq=20
  icon.drawing=off
  label.font="$FONT:Semibold:12.0"
  background.padding_right=0
  script="$PLUGIN_DIR/time.sh"
)

sketchybar --add item time right
sketchybar --set time "${TIME[@]}"

