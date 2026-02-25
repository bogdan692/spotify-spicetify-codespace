FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN sudo dpkg --add-architecture i386

RUN sudo apt-get update && sudo apt-get install -y \
    curl wget git sudo gnupg lsb-release unzip \
    xvfb x11vnc novnc websockify xfce4 xfce4-terminal \
    pulseaudio pavucontrol \
    libasound2 libasound2-plugins \
    fonts-liberation \
    && sudo rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo gpg --dearmor -o /usr/share/keyrings/spotify.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && \
    sudo apt-get update && sudo apt-get install -y spotify-client && \
    sudo rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

ENV PATH="/home/vscode/.spicetify:$PATH"

USER vscode
WORKDIR /home/vscode

COPY .devcontainer/startup.sh /home/vscode/startup.sh
RUN chmod +x /home/vscode/startup.sh

CMD ["/home/vscode/startup.sh"]
