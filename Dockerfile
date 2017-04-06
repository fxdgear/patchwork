FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y libxext-dev libxtst-dev libxkbfile-dev git xz-utils
RUN mkdir -p /opt/node
RUN curl https://nodejs.org/dist/v7.8.0/node-v7.8.0-linux-x64.tar.xz | tar -xJ -C /opt/node --strip-components 1 
ENV PATH /opt/node/bin:$PATH

WORKDIR /code/patchwork
COPY . /code/patchwork

RUN npm install
RUN npm start
