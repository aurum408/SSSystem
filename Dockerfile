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

RUN cd /home && wget ${PHANTOMJS_LINK} -O phantomjs.tar.bz2 \
    && mkdir phantomjs \
    && tar -xvf phantomjs.tar.bz2 -C phantomjs --strip-components=1 \
    && export PATH=${PATH}:${PWD}/phantomjs/bin/phantomjs \
    && alias phantomjs="${PWD}/phantomjs/bin/phantomjs"

RUN cd /home &&  git clone ${PROJ_LINK} \
    && cd SSSystem \
    && pip install -r -y requirements.txt \
    && ln -s /home/SSSystem/src/load_page.js /home/load_page.js

RUN cd /home && alias phantomjs="${PWD}/phantomjs/bin/phantomjs"