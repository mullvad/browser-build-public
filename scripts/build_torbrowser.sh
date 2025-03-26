#!/usr/bin/env bash

set -e

cd tor-browser-build
make fetch
make torbrowser-"$RELEASE" && make torbrowser-incrementals-"$RELEASE"

# build artifacts are stored under a subdir without the "tbb-" or "mb-" prefix
# of TAG, so ignore the first 4 characters in the case of tbb-
cp torbrowser/"$RELEASE"/unsigned/"${TAG:4}"/*.txt ../checksums

rsync --mkpath "$GITHUB_WORKSPACE/tor-browser-build/torbrowser/$RELEASE/unsigned/${TAG:4}/*.txt" cdn1:/torbrowser/"$TAG"/
