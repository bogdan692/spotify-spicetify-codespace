#!/bin/bash

# Віртуальний дисплей для GUI
Xvfb :99 -screen 0 1024x768x16 &

export DISPLAY=:99

# Запуск PulseAudio
pulseaudio --start

# Папка конфігурацій Spicetify
mkdir -p $HOME/.config/spicetify

# Перевірка та оновлення Spicetify
if command -v spicetify &> /dev/null; then
    spicetify upgrade
else
    npm install -g spicetify-cli
fi

# Перевірка Spotify
if command -v spotify &> /dev/null; then
    echo "Spotify встановлено"
else
    echo "Spotify не встановлено"
fi

# Застосування Spicetify
spicetify backup apply

# Запуск Spotify
spotify &

# XFCE + noVNC
startxfce4 &

# Запуск x11vnc для доступу через браузер
x11vnc -display :99 -nopw -forever &
