source "$HOME/.config/sketchybar/icons.sh"

INFO="$(shortcuts run ssid)"
if [ "$INFO" = "" ]; then
    sketchybar --set $NAME label="Disconnected" icon="$WIFI_DISCONN_ICON"
elif [ "$INFO" = "You are not associated with an AirPort network." ]; then
    sketchybar --set $NAME label="Disconnected" icon="$WIFI_DISCONN_ICON"
else
    sketchybar --set $NAME label="$INFO" icon="$WIFI_CONN_ICON"
fi
