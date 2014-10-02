# Docker images for NDN

## Install Docker

Follow the [official installation instructions](http://docs.docker.com/installation/). Docker runs natively on (recent) Linux kernels, and via a VM on Windows and Mac OS X.

## Build the images

This will build all images for Debian, Debian+Node.js, and Ubuntu:

    ./build-all.sh

## Run an image

To run NDN on Ubuntu, run:

    docker run named_data/ubuntu-14.04
