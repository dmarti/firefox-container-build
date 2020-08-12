# Setting up needed packages and dependencies.

FROM debian:stable
ENV TERM linux
ENV SHELL /bin/bash
RUN apt-get -y update  && \
    apt-get -y install curl expect python3 && \
    apt-get clean 

# RUN apt-get -y install autoconf2.13 build-essential nodejs unzip uuid zip


WORKDIR /code
ENV SHELL /bin/bash

RUN curl -o /code/bootstrap.py https://hg.mozilla.org/mozilla-unified/raw-file/default/python/mozboot/bin/bootstrap.py 

# Install required native packages. This will fail because
# the mozilla-central checkout (which will go in mozilla-central) isn't there yet.
RUN echo 2 | python3 /code/bootstrap.py --no-interactive || true

COPY build-firefox.sh /code
COPY mach-bootstrap.expect /code
