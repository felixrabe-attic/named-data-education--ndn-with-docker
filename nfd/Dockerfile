# http://named-data.net/doc/NFD/0.2.0/INSTALL.html#install-nfd-using-the-ndn-ppa-repository-on-ubuntu-linux

FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:named-data/ppa
RUN apt-get update
RUN apt-get install -y nfd

# TODO: Check permissions of Unix socket!
