# syntax=docker/dockerfile:1@sha256:b6afd42430b15f2d2a4c5a02b919e98a525b785b1aaff16747d2f623364e39b6
FROM public.ecr.aws/ubuntu/ubuntu:noble@sha256:ef59d9e82939bbce08973bdffb8761b025f75369fb7d2882cdc4938b5a9e992e

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
