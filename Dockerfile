# syntax=docker/dockerfile:1@sha256:b6afd42430b15f2d2a4c5a02b919e98a525b785b1aaff16747d2f623364e39b6
FROM ubuntu:noble@sha256:89ef6e43e57cb94a23e4b28715a34444de91f45bd410fce3ce00819f86940a9c

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yqq --no-install-recommends \
      curl bash git ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://get.trunk.io -fsSL | bash -s -- -y
