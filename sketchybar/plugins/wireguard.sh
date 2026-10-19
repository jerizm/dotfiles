#!/bin/bash

# WireGuard (wg-quick / wireguard-go) doesn't show up in `scutil --nc list`, so look
# for a utun interface with WireGuard's default MTU (1420) that has an address assigned.
# Fall back to the App Store client, which does register with scutil.
VPN_CONNECTED=$(ifconfig | awk '/^utun[0-9]+:/ { up = /mtu 1420/ } up && /inet / { print; exit }')
[ -z "$VPN_CONNECTED" ] && VPN_CONNECTED=$(scutil --nc list | grep Connected | grep -i wireguard)

if [ -n "$VPN_CONNECTED" ]; then
    sketchybar --set $NAME \
        icon="" \
        label.drawing=off \
        icon.color=0xffa6da95
else
    sketchybar --set $NAME \
        icon="" \
        label.drawing=off \
        icon.color=0xffed8796
fi
