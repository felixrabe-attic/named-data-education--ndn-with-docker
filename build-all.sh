#!/usr/bin/env bash

set -e

CMD() {
  echo "$@"
  "$@"
}

# CMD docker build -t named_data/ubuntu-14.04  ubuntu-14.04
CMD docker build -t named_data/debian-jessie debian-jessie
CMD docker build -t named_data/node-0.10     node-0.10
