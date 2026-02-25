#!/bin/bash

echo "Оновлюємо Spicetify..."
spicetify upgrade

echo "Оновлюємо Spotify..."
sudo apt update && sudo apt install -y spotify-client

echo "Застосовуємо Spicetify..."
spicetify apply

echo "Створюємо віртуальний sink для PulseAudio..."
pactl load-module module-null-sink sink_name=vsink

echo "Запускаємо GUI через Xvfb та xfce4..."
Xvfb :1 -screen 0 1024x768x24 &
export DISPLAY=:1
startxfce4 &

echo "Запускаємо x11vnc для підключення через браузер..."
x11vnc -display :1 -nopw -forever -shared -rfbport 5900 &

echo "Запускаємо Spotify..."
spotify &
