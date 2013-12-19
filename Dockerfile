# DOCKER-VERSION 0.7.2

FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y make gcc build-essential wget
RUN apt-get install -y erlang-dev erlang-manpages erlang-base-hipe \
  erlang-eunit erlang-nox erlang-xmerl erlang-inets libmozjs185-dev \
  libicu-dev libcurl4-gnutls-dev libtool

RUN apt-get -y install git
RUN cd /usr/local/src ; git clone https://git-wip-us.apache.org/repos/asf/couchdb.git
RUN cd /usr/local/src/couchdb ; git checkout 1.5.0

RUN cd /usr/local/src/couchdb ; ./configure
RUN cd /usr/local/src/couchdb ; make
RUN cd /usr/local/src/couchdb ; make install

ADD ./docker.ini /usr/local/etc/couchdb/local.d/docker.ini

EXPOSE 8080

CMD ["/usr/local/bin/couchdb"]

