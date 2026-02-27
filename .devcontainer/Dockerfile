FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    xvfb \
    fluxbox \
    wget \
    curl \
    git \
    python3 \
    python3-numpy \
    websockify \
    novnc \
    libgtk-3-0 \
    libnss3 \
    libxss1 \
    libasound2 \
    dbus-x11 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/spotify.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list \
 && apt-get update \
 && apt-get install -y spotify-client \
 && rm -rf /var/lib/apt/lists/*
