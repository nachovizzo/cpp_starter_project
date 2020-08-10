# @file      Dockerfile
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
FROM ubuntu:bionic
LABEL maintainer="Ignacio Vizzo <ivizzo@uni-bonn.de>"

# setup environment
CMD ["bash"]
ENV OPENCV_VERSION="4.3.0"
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM xterm
ENV GTEST_COLOR 1
ENV DEBIAN_FRONTEND=noninteractive
ENV LLVM_VERSION=10
ENV GCC_VERSION=9

# setup locale
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# Upgrade base image
RUN apt-get update && apt-get upgrade -yqq

# install essentials
RUN apt-get update && apt-get install --no-install-recommends -y \
  openssh-client git build-essential python3 software-properties-common \
  curl rsync jq libgtest-dev libgflags-dev libeigen3-dev qtbase5-dev \
  libqglviewer-headers libboost-all-dev libprotobuf-dev

# install dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
  cppcheck wget apt-transport-https libssl-dev gpg-agent

# install modern toolchains
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key --no-check-certificate | apt-key add -
RUN add-apt-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-${LLVM_VERSION}  main" \
  && apt-get update

RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test && apt-get update
RUN apt update && apt install -yy gcc-${GCC_VERSION} g++-${GCC_VERSION}

COPY install_llvm_toolchain.sh /root
RUN bash /root/install_llvm_toolchain.sh

# Upgrade cmake(TODO: Use ubuntu:bionic). Build cmake with GNU GCC
RUN wget https://github.com/Kitware/CMake/releases/download/v3.17.0/cmake-3.17.0.tar.gz
RUN tar -xf cmake-3.17.0.tar.gz && cd cmake-3.17.0/ &&  \
  env CC=gcc CXX=g++ ./bootstrap && \
  make -j && \
  make -j install

# Install OpenCV4 Dependencies
RUN apt-get update && apt-get install -y libgtk2.0-dev pkg-config \
  libavcodec-dev libavformat-dev libswscale-dev \
  python3-dev python3-numpy libtbb2 libtbb-dev \
  libjpeg-dev libpng-dev libpng++-dev libtiff5-dev libdc1394-22-dev \
  libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common \
  yasm libopencore-amrnb-dev libopencore-amrwb-dev \
  libopenexr-dev libgstreamer-plugins-base1.0-dev libavutil-dev \
  libavfilter-dev libavresample-dev

# Build and insall libopencv + contrib packages
RUN git clone https://github.com/opencv/opencv.git -b ${OPENCV_VERSION} \
  && git clone https://github.com/opencv/opencv_contrib.git -b ${OPENCV_VERSION} \
  && cd opencv \
  && mkdir build && cd build \
  && cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules .. \
  && make -j && make install

# Install fmt library
RUN git clone --depth 1 https://github.com/fmtlib/fmt.git -b 6.2.0 \
  && cd fmt \
  && mkdir build && cd build \
  && cmake .. && make -j all install

# Install google test
RUN git clone --depth 1 https://github.com/google/googletest.git  \
  && cd googletest \
  && mkdir build && cd build \
  && cmake .. && make -j all install

# Install Catch2
RUN git clone --depth 1 https://github.com/catchorg/Catch2.git \
  && cd Catch2 \
  && mkdir build && cd build \
  && cmake -DBUILD_TESTING=OFF .. && make -j all install

# Cleanup
RUN rm -rf /googletest/ /Catch2 /fmt/
RUN rm -rf /opencv/ && rm -rf /opencv_contrib/
RUN rm -rf /cmake-3.17.0*
RUN rm -rf /var/lib/apt/lists/*