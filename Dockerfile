FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
PHANTOMJS_LINK=""

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev wget \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

RUN wget -O phantomjs.tar.bz2 $PHANTOMJS_LINK &&\
    mkdir phantomjs && \
    tar -xvf phantomjs.tar.bz2 --directory phantomjs &&  \
    export PATH=${PATH}:/phantomjs/bin/phantomjs && \
    alias phantomjs="$/phantomjs/bin/phantomjs"

RUN apt clean  && \
    && apt update && \
    apt install -y git-all
