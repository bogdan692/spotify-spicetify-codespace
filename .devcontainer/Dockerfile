# Базовий образ Ubuntu
FROM ubuntu:22.04

# Не інтерактивний режим для apt
ENV DEBIAN_FRONTEND=noninteractive

# Базові пакети
RUN apt-get update && apt-get install -y \
    wget curl git sudo pulseaudio pavucontrol \
    xvfb xfce4 xfce4-terminal x11vnc novnc websockify \
    wine64 wine32 gnupg lsb-release unzip \
    && rm -rf /var/lib/apt/lists/*

# Node.js та spicetify
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g spicetify-cli

# Додаємо Spotify репозиторій та ключ
RUN curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add - \
    && echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list \
    && apt-get update && apt-get install -y spotify-client

# Користувач vscode без пароля
RUN useradd -ms /bin/bash vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/vscode

# Копіюємо скрипт запуску
COPY .devcontainer/startup.sh /home/vscode/startup.sh
RUN chmod +x /home/vscode/startup.sh

USER vscode
