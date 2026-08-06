# syntax=docker/dockerfile:1@sha256:b6afd42430b15f2d2a4c5a02b919e98a525b785b1aaff16747d2f623364e39b6
FROM public.ecr.aws/ubuntu/ubuntu:resolute@sha256:a5da6f6b18c3a4b8dcc73244592f7096f417d2667966d0e33460e9e308f25f67

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
