# DOCKER-VERSION 0.7.2

FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y make gcc build-essential wget
RUN apt-get install -y erlang-dev erlang-manpages erlang-base-hipe \
  erlang-eunit erlang-nox erlang-xmerl erlang-inets libmozjs185-dev \
  libicu-dev libcurl4-gnutls-dev libtool

RUN cd /usr/local/src ; wget http://mirror.csclub.uwaterloo.ca/apache/couchdb/source/1.5.0/apache-couchdb-1.5.0.tar.gz
RUN cd /usr/local/src ; tar xvzf apache-couchdb-1.5.0.tar.gz

RUN cd /usr/local/src/apache-couchdb-* ; ./configure
RUN cd /usr/local/src/apache-couchdb-* ; make
RUN cd /usr/local/src/apache-couchdb-* ; make install

ADD ./docker.ini /usr/local/etc/couchdb/local.d/docker.ini

VOLUME ["/usr/local/etc/couchdb", "/usr/local/etc/couchdb"]

EXPOSE 5984

CMD ["/usr/local/bin/couchdb"]

