FROM ubuntu:xenial
MAINTAINER Steven Bower <sbower@alcyon.net>

ENV LANG C.UTF-8

#&& echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d \
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -q -y --no-install-recommends \
      git \
      ca-certificates \
      python \
      python-pip \
      python-openssl \
      python-libxml2 \
      python-lxml \
    && apt-get clean -q -y \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/data", "/config"]

RUN git clone --depth 1 https://github.com/CouchPotato/CouchPotatoServer.git /couchpotato \
    && apt-get purge -q -y git \
    && apt-get autoremove -q -y

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 5050

CMD ["/start.sh"]

