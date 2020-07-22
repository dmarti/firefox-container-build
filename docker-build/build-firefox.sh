#!/bin/bash

export PATH="$PATH:/root/.local/bin"

(cd mozilla-central && ../mach-bootstrap.expect)

(cd mozilla-central && ./mach build)
