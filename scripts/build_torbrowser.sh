#!/usr/bin/env bash

set -e

cd tor-browser-build
make fetch
make torbrowser-"$RELEASE" && make torbrowser-incrementals-"$RELEASE"

# build artifacts are stored under a subdir without the "tbb-" or "mb-" prefix
# of TAG, so ignore the first 4 characters in the case of tbb-
tag_version="${TAG:4}"

cp torbrowser/"$RELEASE"/unsigned/"$tag_version"/*.txt ../checksums

rsync --mkpath "$GITHUB_WORKSPACE/tor-browser-build/torbrowser/$RELEASE/unsigned/$tag_version/"*.txt cdn1:/torbrowser/"$tag_version"/
