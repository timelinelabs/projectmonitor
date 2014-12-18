FROM quay.io/timeline_labs/ruby:2.0.0-p353
MAINTAINER Jade McGough <jade@timelinelabs.com>

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends libqt4-dev qt4-qmake libqtwebkit-dev \
    libpq-dev nodejs

WORKDIR /tmp
ADD Gemfile /tmp
ADD Gemfile.lock /tmp
RUN bundle install --system &&\
    rm -rf /tmp/*

ADD . /data/app
WORKDIR /data/app

CMD ["/bin/bash"]
