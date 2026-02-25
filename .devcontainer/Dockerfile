FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:99
ENV PULSE_SERVER=unix:/run/user/1000/pulse/native

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y \
    curl wget git sudo gnupg2 software-properties-common \
    pulseaudio pulseaudio-utils alsa-utils \
    xvfb xfce4 xfce4-terminal dbus-x11 \
    x11vnc novnc websockify \
    libgtk-3-0 libnss3 libasound2 libxss1 libxtst6 libx11-xcb1 \
    unzip ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Spotify
RUN curl -fsSL https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --dearmor -o /usr/share/keyrings/spotify.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list \
    && apt-get update && apt-get install -y spotify-client \
    && rm -rf /var/lib/apt/lists/*

# Spicetify (ОФІЦІЙНО)
RUN curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

# Користувач
RUN useradd -ms /bin/bash vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER vscode
WORKDIR /home/vscode

COPY .devcontainer/startup.sh /home/vscode/startup.sh

RUN chmod +x /home/vscode/startup.sh

CMD ["/home/vscode/startup.sh"]
