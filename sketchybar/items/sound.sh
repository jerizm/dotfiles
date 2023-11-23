SOUND=(
  update_freq=60
	script="$PLUGIN_DIR/sound.sh"
)

sketchybar --add item sound right
sketchybar --set sound "${SOUND[@]}"

