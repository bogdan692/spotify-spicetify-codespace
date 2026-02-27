FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    ca-certificates \
    gnupg \
    lsb-release \
    libasound2 \
    libx11-6 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libxrandr2 \
    libgbm1 \
    libgtk-3-0 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Spotify (Linux client)
RUN curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/spotify.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list \
    && apt-get update \
    && apt-get install -y spotify-client \
    && rm -rf /var/lib/apt/lists/*

# Spicetify
RUN curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | bash

ENV PATH="/home/vscode/.spicetify:${PATH}"
