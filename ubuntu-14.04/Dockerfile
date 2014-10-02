FROM ubuntu:14.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

# # Missing dependencies: http://redmine.named-data.net/issues/2013
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y procps psmisc sudo

RUN add-apt-repository -y ppa:named-data/ppa
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nfd

# TODO: nfd-start-fg or similar
# CMD nfd
