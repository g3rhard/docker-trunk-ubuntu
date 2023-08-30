FROM alpine:edge

RUN apk update && apk add curl bash git build-base gcompat libstdc++

RUN curl https://get.trunk.io -fsSL | bash -s -- -y

RUN trunk check --ci
