FROM developer.redhat.com/base:2.0.0
MAINTAINER Jason Porter <jporter@redhat.com>

ARG http_proxy
ARG https_proxy

# install deps required by our build
RUN yum install -y  \
  bison \
  bzip2 \
  epel-release \
  gcc \
  gcc-c++ \
  git \
  libcurl-devel \
  libffi-devel \
  libtool \
  libxml2 \
  libxml2-devel \
  libxslt \
  libxslt-devel \
  libyaml-devel \
  openssl-devel \
  patch \
  readline-devel \
  ruby-devel \
  sqlite-devel \
  tar \
  which \
  wget

WORKDIR /tmp

# Install ruby and rubygems
RUN wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.4.tar.gz \
    && tar -xzf /tmp/ruby-2.3.4.tar.gz \
    && cd ruby-2.3.4/ \
    && ./configure --disable-install-doc \
    && make \
    && make install \
    && rm -rf /tmp/*

RUN wget https://rubygems.org/rubygems/rubygems-2.6.13.tgz \
    && tar -zxf /tmp/rubygems-2.6.13.tgz \
    && cd /tmp/rubygems-2.6.13 \
    && ruby setup.rb \
    && rm -rf /tmp/* \
    && echo "gem: --no-ri --no-rdoc" > ~/.gemrc

RUN gem install bundler --version 1.15.4 --no-rdoc --no-ri
