FROM ubuntu:14.04


ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:team-gcc-arm-embedded/ppa
RUN add-apt-repository -r ppa:terry.guo/gcc-arm-embedded
RUN apt-get update
RUN apt-get remove gcc-arm-none-eabi

RUN apt-get install -y \
                       build-essential \
                       cmake \
                       git \
                       gcc-arm-embedded \
                       libc++-dev \
                       lcov \
                       cppcheck \
                       doxygen

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
