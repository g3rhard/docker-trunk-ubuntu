# syntax=docker/dockerfile:1.7
ARG UBUNTU_VERSION="jammy-20231211.1"

FROM ubuntu:${UBUNTU_VERSION}

RUN apt-get update && apt-get install -yqq --no-install-recommends \
      curl bash git ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://get.trunk.io -fsSL | bash -s -- -y
