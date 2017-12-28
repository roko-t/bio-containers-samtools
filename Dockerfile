# samtools
#
# VERSION    0.0.1

# Use ubuntu as a parent image
FROM ubuntu:16.04

MAINTAINER Hiroko Tanaka <hiroko@hgc.jp>

LABEL Description="samtools v.1.3.1 with htslib-1.3.1" \
      Project="Genomon-Project Dockerization" \
      Version="1.0"

# Install required libraries in order to create Samtools
RUN apt-get update && apt-get install -y \
    bzip2 \
    gcc \
    make \
    wget \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

# Download , build  and install Samtools
RUN wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 && \
    tar jxvf samtools-1.3.1.tar.bz2 && \
    cd samtools-1.3.1/htslib-1.3.1 && \
    ./configure && make && make install && \
    cd ../ && ./configure --without-curses && make && make install

