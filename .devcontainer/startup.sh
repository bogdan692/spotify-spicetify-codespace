#!/bin/bash

set -e

echo "=== START SETUP ==="

# Додаємо spicetify в PATH
export PATH="$HOME/.spicetify:$PATH"

# Чекаємо трохи щоб Spotify точно був доступний
sleep 2

echo "=== INIT SPICETIFY ==="

# Ініціалізація
spicetify config-dir || true

# Базова конфігурація
spicetify config current_theme SpicetifyDefault
spicetify config color_scheme base

# Backup + apply
spicetify backup apply

echo "=== DONE ==="
