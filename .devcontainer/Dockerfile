FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Оновлення системи та базові утиліти
RUN apt-get update && apt-get install -y \
    wget curl git sudo locales keyboard-configuration \
    x11vnc xfce4 xfce4-terminal xterm dbus-x11 \
    net-tools xauth xvfb novnc websockify \
    wine64 winetricks \
    gnupg2 apt-transport-https software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Локаль
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Автоматична клавіатура US
RUN echo 'keyboard-configuration keyboard-configuration/layoutcode string us' | debconf-set-selections \
    && dpkg-reconfigure -f noninteractive keyboard-configuration

# Spotify репозиторій
RUN curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add - \
    && echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list

# Встановлення Spotify
RUN apt-get update && apt-get install -y spotify-client && rm -rf /var/lib/apt/lists/*

# Spicetify CLI
RUN curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

# Копіюємо стартовий скрипт
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 6080

CMD ["/start.sh"]
