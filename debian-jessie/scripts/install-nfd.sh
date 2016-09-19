#!/usr/bin/env bash

# This script completely downloads and builds and installs NFD and removes its
# build directory to avoid intermediary Docker layers and to reduce the size
# of the resulting Docker image.  This should help decrease storage
# requirements and speed up the publication to the Docker registry.

set -e
cd /source

pushd ./NFD
  git checkout -b build ${NDN_NFD_VERSION}
  ./waf configure --prefix=/
  ./waf
  ./waf install
popd
rm -rf ./NFD

cp /etc/ndn/nfd.conf.sample /etc/ndn/nfd.conf
