#!/usr/bin/env bash

set -e

cd tor-browser-build
make fetch
make mullvadbrowser-"$RELEASE" && make mullvadbrowser-incrementals-"$RELEASE"

# build artifacts are stored under a subdir without the "tbb-" or "mb-" prefix
# of TAG, so ignore the first 3 characters in the case of mb-
cp mullvadbrowser/"$RELEASE"/unsigned/"${TAG:3}"/*.txt ../checksums

rsync --mkpath "$GITHUB_WORKSPACE/tor-browser-build/mullvadbrowser/$RELEASE/unsigned/${TAG:3}/*.txt" cdn1:/mullvadbrowser/"$TAG"/
