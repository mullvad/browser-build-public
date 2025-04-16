#!/usr/bin/env bash

set -e

cd tor-browser-build
make fetch
make torbrowser-"$RELEASE" && make torbrowser-incrementals-"$RELEASE"

# Tor labels their builds as alpha with an 'a' instead of a second dot. This
# regex extracts the base version string.
# tbb-13.5.11-build1 -> 13.5.11
# tbb-13.5a11-build1 -> 13.5a11
version=$(echo "$TAG" | grep -oP "\d+\.\d+([a\.]\d+)?")

cp torbrowser/"$RELEASE"/unsigned/"$version"/*.txt ../checksums
