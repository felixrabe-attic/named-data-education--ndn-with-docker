#!/usr/bin/env bash

# This script completely downloads and builds and installs ndn-cxx and removes
# its build directory to avoid intermediary Docker layers and to reduce the
# size of the resulting Docker image.  This should help decrease storage
# requirements and speed up the publication to the Docker registry.

set -e
cd /source

pushd ./ndn-cxx
  git checkout -b build ${NDN_CXX_VERSION}
  ./waf configure --prefix=/usr
  ./waf
  ./waf install
popd
rm -rf ./ndn-cxx
