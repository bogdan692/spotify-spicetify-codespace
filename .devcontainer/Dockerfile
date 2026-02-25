FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget curl git pulseaudio pavucontrol novnc websockify x11vnc xfce4 xfce4-terminal wine64 wine32 nodejs npm xvfb

RUN curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add -
RUN echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list
RUN apt-get update && apt-get install -y spotify-client

RUN npm install -g spicetify-cli

WORKDIR /workspace

COPY startup.sh /workspace/startup.sh
RUN chmod +x /workspace/startup.sh
