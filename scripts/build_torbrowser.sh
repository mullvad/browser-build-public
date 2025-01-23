#!/usr/bin/env bash

set -e

cd tor-browser-build
make fetch
make torbrowser-"$RELEASE" && make torbrowser-incrementals-"$RELEASE"

version=$(echo "$TAG" | grep -oP "\d+\.\d+\.\d+")  # tbb-13.5.11-build1 -> 13.5.11

cp torbrowser/"$RELEASE"/unsigned/"$version"/*.txt ../checksums
