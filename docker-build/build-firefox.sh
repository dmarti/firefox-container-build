#!/bin/bash

export PATH="$PATH:/root/.local/bin"

if [ !-d /root/.mozbuild ]; then
	mkdir -p /root/.mozbuild
	(cd mozilla-central && ../mach-bootstrap.expect)
fi

(cd mozilla-central && ./mach build)
