#!/bin/bash
# -----------------------------------------------------------------------------
# Автоматичний запуск XFCE + VNC + noVNC + перевірка оновлень Spotify та Spicetify
# -----------------------------------------------------------------------------

export $(dbus-launch)

# --- Функція перевірки та оновлення Spotify ---
update_spotify() {
    echo "[INFO] Перевірка оновлення Spotify..."
    apt-get update -qq
    UPGRADES=$(apt-get -s upgrade | grep spotify-client || true)
    if [ ! -z "$UPGRADES" ]; then
        echo "[INFO] Оновлення Spotify доступне. Виконуємо..."
        apt-get install -y spotify-client
        echo "[INFO] Spotify оновлено. Виконуємо spicetify upgrade..."
        spicetify upgrade
    else
        echo "[INFO] Spotify актуальний."
    fi
}

# --- Функція перевірки та оновлення Spicetify CLI ---
update_spicetify() {
    echo "[INFO] Перевірка оновлення Spicetify..."
    LOCAL_VER=$(spicetify -v | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+")
    REMOTE_VER=$(curl -s https://api.github.com/repos/spicetify/cli/releases/latest | grep -Eo '"tag_name": "[^"]+' | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')
    if [ "$LOCAL_VER" != "$REMOTE_VER" ]; then
        echo "[INFO] Оновлення Spicetify доступне. Виконуємо..."
        curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
        echo "[INFO] Spicetify оновлено."
    else
        echo "[INFO] Spicetify актуальний."
    fi
}

# --- Запуск перевірок оновлень ---
update_spotify
update_spicetify

# --- Старт VNC ---
x11vnc -storepasswd 1234 /root/.vnc/passwd
x11vnc -forever -usepw -display :0 -rfbport 5900 &

# --- Старт XFCE ---
startxfce4 &

# --- Старт noVNC ---
websockify -D --web=/usr/share/novnc/ 6080 localhost:5900

# --- Тримати контейнер активним ---
tail -f /dev/null
