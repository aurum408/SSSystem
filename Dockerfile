FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV PHANTOMJS_LINK="https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2"
ENV PROJ_LINK="https://github.com/aurum408/SSSystem.git"

RUN apt update \
  && apt install -y python3-pip python3-dev wget libfontconfig1 git\
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

RUN cd / && wget ${PHANTOMJS_LINK} -O phantomjs.tar.bz2 \
    && tar -xvf phantomjs.tar.bz2 \
    && export PATH=${PATH}:/phantomjs/bin/phantomjs \
    && alias phantomjs="$/phantomjs/bin/phantomjs" \

RUN git clone ${PROJ_LINK}

