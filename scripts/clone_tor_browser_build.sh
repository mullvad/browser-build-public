#!/usr/bin/env bash

set -e

if [ ! -d tor-browser-build ]; then
    git clone https://gitlab.torproject.org/tpo/applications/tor-browser-build.git
fi

cd tor-browser-build
git fetch
git checkout "$TAG"
