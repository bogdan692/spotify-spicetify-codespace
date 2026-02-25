#!/bin/bash

export DISPLAY=:99

Xvfb :99 -screen 0 1280x720x16 &

pulseaudio --start

mkdir -p $HOME/.config/spicetify

spotify &

sleep 20

spicetify backup apply || true

startxfce4 &

x11vnc -display :99 -nopw -forever -listen 0.0.0.0 -rfbport 5900 &

websockify --web=/usr/share/novnc/ 6080 localhost:5900 &
