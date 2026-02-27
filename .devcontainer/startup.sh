#!/usr/bin/env bash

set -e

export DISPLAY=:1

echo "Starting virtual display..."
Xvfb :1 -screen 0 1280x800x24 &

sleep 2

echo "Starting XFCE..."
startxfce4 &

sleep 3

echo "Starting VNC..."
x11vnc -display :1 -nopw -forever -shared &

echo "Starting noVNC..."
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &

echo "Installing Spicetify..."
if ! command -v spicetify &> /dev/null; then
    curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
fi

export PATH="$HOME/.spicetify:$PATH"

mkdir -p "$HOME/.config/spotify"

spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify backup apply || true

echo "Launching Spotify..."
spotify &

echo "READY → відкрий порт 6080"
