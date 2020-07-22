# Setting up needed packages and dependencies.

FROM debian:stable
ENV TERM linux
ENV SHELL /bin/bash
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install expect python python3 python-pip python3-pip wget
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libasound2-dev libcurl4-openssl-dev libdbus-1-dev libdbus-glib-1-dev libdrm-dev libgtk-3-dev libgtk2.0-dev libpulse-dev libx11-xcb-dev libxt-dev xvfb yasm
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nasm mercurial mercurial-common openssh-client unzip zip autoconf2.13
RUN DEBIAN_FRONTEND=noninteractive apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /code
ENV SHELL /bin/bash

# COPY mozilla-central /code/
# RUN ls /code
RUN wget https://hg.mozilla.org/mozilla-unified/raw-file/default/python/mozboot/bin/bootstrap.py -O /code/bootstrap.py

RUN echo 2 | python3 /code/bootstrap.py --no-interactive || true

COPY build-firefox.sh /code
COPY mach-bootstrap.expect /code
