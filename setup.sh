#!/bin/sh

sudo service docker restart

# workaround for /tmp issue
# https://github.com/earthly/earthly/issues/116

# Will not be needed in future versions
# https://github.com/earthly/earthly/pull/121

[ -e /var/cache ] && sudo mkdir -p /var/cache/earthly && (cd /tmp && sudo ln -sf ../var/cache/earthly earthly )

# Make the cache bigger.

earth --buildkit-cache-size-mb 1000000 prune --reset
