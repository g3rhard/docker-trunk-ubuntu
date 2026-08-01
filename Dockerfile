# syntax=docker/dockerfile:1@sha256:b6afd42430b15f2d2a4c5a02b919e98a525b785b1aaff16747d2f623364e39b6
FROM public.ecr.aws/ubuntu/ubuntu:noble@sha256:be20a0347f238b7d373edddc55923443b21dd9a60277bf8a93e43458cd0bf2fc

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends \
      curl \
      bash \
      git \
      ca-certificates \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://get.trunk.io -fsSL | bash -s -- -y
