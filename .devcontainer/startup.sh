#!/bin/bash
set -e

# Оновлення системи
apt-get update && apt-get upgrade -y

# Перевірка Spotify та оновлення
if command -v spotify &> /dev/null; then
    echo "Spotify встановлено, перевіряємо оновлення..."
    apt-get install --only-upgrade -y spotify-client || true
fi

# Перевірка Spicetify
if command -v spicetify &> /dev/null; then
    echo "Spicetify встановлено, оновлюємо..."
    spicetify upgrade || true
else
    echo "Spicetify не знайдено, встановлюємо..."
    curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
fi

echo "Запуск Spotify..."
spotify &
wait
