#!/bin/bash

export LINK="https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2"

apt-get update \
  && apt-get install -y python3-pip python3-dev wget \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && pip3 install virtualenv \
  && rm -rf /var/lib/apt/lists/*

wget -O phantomjs.tar.bz2 $PHANTOMJS_LINK &&\
    mkdir phantomjs && \
    tar -xvf phantomjs.tar.bz2 --directory phantomjs &&  \
    export PATH=${PATH}:/phantomjs/bin/phantomjs && \
    alias phantomjs="$/phantomjs/bin/phantomjs"

apt-get update && apt-get install -y git-all