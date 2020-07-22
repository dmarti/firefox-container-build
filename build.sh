#!/bin/bash

# Run this script from the directory where it is installed.
trap popd EXIT
pushd $PWD &> /dev/null
cd $(dirname "$0")

dockerfail() {
	echo
	echo "Docker not found. Check that Docker is installed and running."
	echo
	exit 1
}
docker ps &> /dev/null || dockerfail

set -e
set -x

# Volume for stuff that gets cached in the home directory.
# (There is a copy of a book on Rust in here, cool)
mkdir -p roothome

# Docker build context in a subdirectory so Docker doesn't see all of
# mozilla-central as part of the build context.
(cd docker-build && docker build --tag=firefox_build . )

# Do the build in a volume.
docker run --volume "$(pwd)"/mozilla-central:/code/mozilla-central:rw,Z \
	--volume "$(pwd)"/roothome:/root:rw,Z \
	--entrypoint /code/build-firefox.sh firefox_build

