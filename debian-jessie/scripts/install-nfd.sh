#!/usr/bin/env bash

# This script completely downloads and builds and installs NFD and removes its
# build directory to avoid intermediary Docker layers and to reduce the size
# of the resulting Docker image.  This should help decrease storage
# requirements and speed up the publication to the Docker registry.

set -e
cd /source

git clone --recursive https://github.com/felixrabe/NFD.git
pushd ./NFD
  git checkout -b release-build origin/ndn-start-fg
  ./waf configure
  ./waf
  ./waf install
popd
rm -rf ./NFD

cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn/nfd.conf
