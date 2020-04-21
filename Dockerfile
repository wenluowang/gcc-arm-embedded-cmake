FROM ubuntu:18.04


ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:gcc-arm-embedded/ppa
RUN apt-get update

RUN apt-get install -y \
                       build-essential \
                       cmake \
                       git \
                       gcc-arm-embedded=4.9:4.9-2015-q3-update \
                       libc++-dev \
                       lcov \
                       cppcheck \
                       doxygen

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
