FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:named-data/ppa
RUN apt-get update
RUN apt-get install -y nfd

CMD nfd
