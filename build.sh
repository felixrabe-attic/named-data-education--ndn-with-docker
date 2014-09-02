#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "$DIR/nfd-felix/bin/fn"

docker build -t nfd nfd
docker build -t nfd-felix nfd-felix
