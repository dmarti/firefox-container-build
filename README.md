# Let's build Firefox with Earthly

Trying to get a reasonable Firefox build done in a container environment.

Based on instructions here: https://firefox-source-docs.mozilla.org/setup/linux_build.html

This should use your working copy of mozilla-central in the current directory.


# How to build (WIP, not working yet)

1. Run `setup.sh` to expand and move the Earthly cache

2. Check out mozilla-central in this directory: `hg clone https://hg.mozilla.org/mozilla-central/ mozilla-central`

3. `earth +build`
