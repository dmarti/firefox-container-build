#!/bin/bash

export PATH="$PATH:/root/.local/bin"

mkdir -p /root/.mozbuild

(cd mozilla-central && ../mach-bootstrap.expect)

(cd mozilla-central && ./mach build)
