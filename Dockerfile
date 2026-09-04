# syntax=docker/dockerfile:1@sha256:87999aa3d42bdc6bea60565083ee17e86d1f3339802f543c0d03998580f9cb89
FROM public.ecr.aws/ubuntu/ubuntu:resolute@sha256:a8724cce691d74a71c42574d3c7e4ef59977b4c48f274cd8bc075e53339bae82 AS trunk-installer

  ENV DEBIAN_FRONTEND=noninteractive

  RUN apt-get update -qq && \
      apt-get install -yqq --no-install-recommends \
        ca-certificates \
        curl \
      && \
      rm -rf /var/lib/apt/lists/*

  RUN curl --fail --show-error --silent --location \
        --proto '=https' --tlsv1.2 \
        https://trunk.io/releases/trunk \
        --output /tmp/trunk-installer && \
      chmod 0755 /tmp/trunk-installer && \
      /tmp/trunk-installer --version

FROM public.ecr.aws/ubuntu/ubuntu:resolute@sha256:a8724cce691d74a71c42574d3c7e4ef59977b4c48f274cd8bc075e53339bae82

LABEL org.opencontainers.image.title="Trunk CLI on Ubuntu" \
      org.opencontainers.image.description="Containerized Trunk CLI tooling" \
      org.opencontainers.image.source="https://github.com/g3rhard/docker-trunk-ubuntu" \
      io.trunk.version-manifest="/usr/share/trunk/version.yaml"

  ENV DEBIAN_FRONTEND=noninteractive

  RUN apt-get update -qq && \
      apt-get install -yqq --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        git \
      && \
      rm -rf /var/lib/apt/lists/*

  # Copy only the verified CLI binary; exclude the launcher and its build cache.
  COPY --from=trunk-installer /root/.cache/trunk/cli/*-linux-*/trunk /usr/local/bin/trunk
  COPY --from=trunk-installer /root/.cache/trunk/cli/*-linux-*/version /usr/share/trunk/version.yaml

  RUN useradd --create-home --uid 10001 --shell /bin/bash trunk

  USER trunk
  WORKDIR /workspace

  CMD ["trunk", "--help"]
