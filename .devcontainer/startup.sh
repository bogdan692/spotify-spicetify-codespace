#!/bin/bash

export DISPLAY=:99

# Запуск X серверу
Xvfb :99 -screen 0 1280x800x16 &

sleep 2

# DBUS
export $(dbus-launch)

# PulseAudio
pulseaudio --start --exit-idle-time=-1

# XFCE
startxfce4 &

sleep 5

# Запуск Spotify (перший раз)
spotify &

echo "Очікування 25 секунд для ініціалізації Spotify..."
sleep 25

# Spicetify автооновлення
if command -v spicetify &> /dev/null; then
    echo "Оновлення Spicetify..."
    spicetify update || true
else
    echo "Встановлення Spicetify..."
    curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
fi

# Backup + apply
echo "Застосування Spicetify..."
spicetify backup apply || true

# Перезапуск Spotify з темами
pkill spotify || true
sleep 3
spotify &

# VNC
x11vnc -display :99 -forever -nopw -rfbport 5900 &

# noVNC (WEB)
websockify --web=/usr/share/novnc/ 6080 localhost:5900
