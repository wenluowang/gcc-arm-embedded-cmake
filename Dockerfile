FROM ubuntu:18.04
LABEL maintainer="wenluo <406988832@qq.com>"
LABEL Description="Image for building and debugging arm-embedded projects from git"
WORKDIR /work

ADD . /work

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
# Development files
      build-essential \
      git \
      bzip2 \
      wget && \
    apt-get clean
    curl  -L "https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2" --output /tmp/gcc-arm-none-eabi.tar.bz2 && \
    mkdir -p /opt && \
    cd /opt && \
    tar xjf /tmp/gcc-arm-none-eabi.tar.bz2 && \
    rm /tmp/gcc-arm-none-eabi.tar.bz2

    ENV PATH "$PATH:/opt/gcc-arm-none-eabi-4_8-2014q3-20140805/bin"
