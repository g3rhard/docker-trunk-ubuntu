# syntax=docker/dockerfile:1@sha256:865e5dd094beca432e8c0a1d5e1c465db5f998dca4e439981029b3b81fb39ed5
FROM ubuntu:noble@sha256:6015f66923d7afbc53558d7ccffd325d43b4e249f41a6e93eef074c9505d2233

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yqq --no-install-recommends \
      curl bash git ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://get.trunk.io -fsSL | bash -s -- -y
