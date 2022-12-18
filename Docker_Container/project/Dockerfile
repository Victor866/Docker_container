
FROM ubuntu:18.04
# Create code directory
RUN mkdir /source
# Set working directory
WORKDIR /source

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get update -y  && \
    apt-get install -y git  && \
    apt-get install -y vim
RUN apt-get update && \
    apt-get install -y curl \
    wget \
    openjdk-11-jdk
RUN apt-get install -y default-jre
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y eclipse-platform
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/jre/bin/java
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update
RUN command apt-get install -y ethereum
RUN apt install -y build-essential
# Install Truffle
RUN npm install -g truffle && npm config set bin-links false
RUN npm install -g --save ethereumjs-testrpc

RUN  apt-get update
