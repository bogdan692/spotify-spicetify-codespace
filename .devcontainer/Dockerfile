# Базовий образ
FROM ubuntu:22.04

# Налаштування змінних оточення
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Оновлення та установка потрібних пакетів
RUN apt-get update && apt-get install -y \
    wget curl git sudo locales keyboard-configuration \
    x11vnc xfce4 xfce4-terminal xterm dbus-x11 \
    net-tools xauth xvfb novnc websockify \
    wine64 winetricks \
    gnupg2 apt-transport-https software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Генерація локалі
RUN locale-gen en_US.UTF-8

# Налаштування клавіатури на US layout
RUN echo 'keyboard-configuration keyboard-configuration/layoutcode string us' | debconf-set-selections \
    && dpkg-reconfigure -f noninteractive keyboard-configuration

# Додаємо репозиторій Spotify
RUN curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add - \
    && echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list

# Встановлення Spotify
RUN apt-get update && apt-get install -y spotify-client && rm -rf /var/lib/apt/lists/*

# Встановлення Spicetify
RUN curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

# Копіюємо стартовий скрипт
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Точка входу
ENTRYPOINT ["/startup.sh"]
