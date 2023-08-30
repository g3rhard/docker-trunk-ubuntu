FROM alpine:edge

RUN apk update && apk add curl bash git

RUN curl https://get.trunk.io -fsSL | bash -s -- -y
