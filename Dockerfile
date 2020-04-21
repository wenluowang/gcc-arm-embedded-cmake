FROM ubuntu:14.04


ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update
RUN apt-get install -y software-properties-common

RUN apt-get install -y \
                       build-essential \
                       cmake \
                       git \
                       libc++-dev \
                       lcov \
                       cppcheck 
 RUN dpkg --add-architecture i386 && \
apt-get update && apt-get -y install build-essential vim-common wget git bzip2 make python libc6:i386 astyle clang cmake && \
wget https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2 && \
mkdir -p /usr/local/bin/ && \
tar -xf gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2 -C /usr/local/bin/ 

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
