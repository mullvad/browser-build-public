#!/usr/bin/env bash

set -e

cd tor-browser-build
make fetch
make mullvadbrowser-"$RELEASE" && make mullvadbrowser-incrementals-"$RELEASE"

# build artifacts are stored under a subdir without the "tbb-" or "mb-" prefix
# of TAG, so ignore the first 3 characters in the case of mb-
tag_version="${TAG:3}"

cp mullvadbrowser/"$RELEASE"/unsigned/"$tag_version"/*.txt ../checksums

rsync --mkpath "$GITHUB_WORKSPACE/tor-browser-build/mullvadbrowser/$RELEASE/unsigned/$tag_version/"*.txt cdn1:/mullvadbrowser/"$tag_version"/
