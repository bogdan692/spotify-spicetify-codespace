#!/bin/bash

echo "Оновлюємо Spicetify..."
spicetify upgrade

echo "Оновлюємо Spotify..."
apt-get update && apt-get install -y spotify-client

echo "Застосовуємо Spicetify..."
spicetify apply

echo "Створюємо віртуальний аудіо-пристрій..."
pactl load-module module-null-sink sink_name=vsink

echo "Запускаємо GUI..."
Xvfb :1 -screen 0 1024x768x24 &
export DISPLAY=:1
startxfce4 &

echo "Запускаємо x11vnc..."
x11vnc -display :1 -nopw -forever -shared -rfbport 5900 &

echo "Запускаємо Spotify..."
spotify &
