# buildpack-deps:jessie is debian:jessie with build tools:
FROM buildpack-deps:jessie

RUN apt-get update

# Common dependencies and setup, omitting stuff already included in 'buildpack-deps':
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libpcap-dev libcrypto++-dev libboost-all-dev

# Missing dependencies: http://redmine.named-data.net/issues/2013
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y procps psmisc sudo

RUN mkdir -p /scripts /source

ADD ./scripts/install-ndn-cxx.sh /scripts/
RUN /scripts/install-ndn-cxx.sh

ADD ./scripts/install-nfd.sh /scripts/
RUN /scripts/install-nfd.sh

CMD /usr/local/bin/nfd-start-fg
