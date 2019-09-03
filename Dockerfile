FROM debian:stretch-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get -u -y dist-upgrade \
 && apt-get install -y --no-install-recommends lsb-release gnupg2 wget ca-certificates \
 && wget -O /tmp/percona-release_latest.generic_all.deb https://repo.percona.com/apt/percona-release_latest.generic_all.deb \
 && dpkg -i /tmp/percona-release_latest.generic_all.deb \
 && rm /tmp/percona-release_latest.generic_all.deb \
 && apt-get -y purge wget ca-certificates --auto-remove \
 && apt-get clean \
 && rm -rf /var/cache/apt/*

ONBUILD RUN apt-get update \
 && apt-get -y install percona-release