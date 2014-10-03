# Docker images for NDN

**WARNING: This is not production quality!** The configuration is copied from the sample and thus has no proper access control. See #5.

This is the only issue I know of at the moment. If you see other problems that prevent this setup from being usable for (experimental) "production", please [open a new issue](https://github.com/named-data-education/ndn-with-docker/issues/new).

## Install Docker

Follow the [official installation instructions](http://docs.docker.com/installation/). Docker runs natively on (recent) Linux kernels, and via a VM on Windows and Mac OS X.

## Build the images

This will build all images for Debian, Debian+Node.js, and Ubuntu:

    ./build-all.sh

## Run an image

To run NDN on Ubuntu, run:

    docker run named_data/ubuntu-14.04
