FROM ubuntu:jammy-20230804

RUN apt update && apt-get install -yqq \
      curl bash git

RUN curl https://get.trunk.io -fsSL | bash -s -- -y

RUN trunk check --ci
