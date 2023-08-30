FROM alpine:edge

RUN apk update && apk add curl bash git libc6-compat

RUN curl https://get.trunk.io -fsSL | bash -s -- -y

RUN trunk check --ci
