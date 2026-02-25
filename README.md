# Spotify + Spicetify Codespace

## Як запустити

1. Відкрити репозиторій на GitHub → Codespaces → Create new codespace.
2. Дочекатися, поки контейнер збудується.
3. Скрипт `startup.sh` автоматично:
   - оновлює Spicetify та Spotify
   - запускає GUI (xfce4)
   - запускає x11vnc для доступу через браузер
   - запускає Spotify + Spicetify

4. Відкрити порт 6080 у Codespaces → веб-доступ до GUI.

## Звук

- Поки звук через PulseAudio віртуальний (вироблений в контейнері)
- Для повної трансляції звуку потрібен додатковий WebRTC стрім.
