FROM ubuntu:jammy-20230804

RUN apt-get update && apt-get install -yqq --no-install-recommends \
      curl bash git

RUN curl https://get.trunk.io -fsSL | bash -s -- -y
