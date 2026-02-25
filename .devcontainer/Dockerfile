FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y \
    wget curl git sudo pulseaudio pavucontrol \
    xvfb xfce4 xfce4-terminal x11vnc novnc websockify \
    wine64 wine32-development gnupg lsb-release unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g spicetify-cli

RUN curl -fsSL https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/spotify.gpg \
    && echo "deb [signed-by=/etc/apt/trusted.gpg.d/spotify.gpg] http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list \
    && apt-get update && apt-get install -y spotify-client \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/vscode

COPY .devcontainer/startup.sh /home/vscode/startup.sh
RUN chmod +x /home/vscode/startup.sh

USER vscode
CMD ["/home/vscode/startup.sh"]
