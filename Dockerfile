FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev wget \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

RUN
    wget "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2" &&\
    mkdir phantomjs && \
    tar -xvf phantomjs-2.1.1-linux-x86_64.tar.bz2 --directory phantomjs &&  \
    export PATH=${PATH}:/phantomjs/bin/phantomjs && \
    alias phantomjs="${HOME}/phantomjs/bin/phantomjs"

RUN apt update && \
    apt install -y git && \
    git clone https://github.com/aurum408/SSSystem.git


#ENTRYPOINT ["python3"]