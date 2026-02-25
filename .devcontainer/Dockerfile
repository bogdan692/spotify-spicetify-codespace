# Базовий образ Ubuntu
FROM ubuntu:22.04

# Мінімальні оновлення та базові пакети
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget curl git pulseaudio pavucontrol \
    novnc websockify x11vnc xfce4 xfce4-terminal \
    wine64 wine32 xvfb sudo gnupg lsb-release

# Створюємо користувача vscode з правами sudo
RUN useradd -ms /bin/bash vscode && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER vscode
WORKDIR /home/vscode

# Встановлюємо Node.js + npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
RUN sudo apt install -y nodejs

# Встановлюємо Spicetify CLI
RUN sudo npm install -g spicetify-cli

# Встановлюємо Spotify Linux клієнт
RUN curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
RUN echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
RUN sudo apt update && sudo apt install -y spotify-client

# Копіюємо скрипт запуску
COPY startup.sh /home/vscode/startup.sh
RUN chmod +x /home/vscode/startup.sh

# Встановлюємо робочу директорію
WORKDIR /workspace
