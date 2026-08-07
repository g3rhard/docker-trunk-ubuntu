# syntax=docker/dockerfile:1@sha256:b6afd42430b15f2d2a4c5a02b919e98a525b785b1aaff16747d2f623364e39b6
FROM public.ecr.aws/ubuntu/ubuntu:resolute@sha256:a5da6f6b18c3a4b8dcc73244592f7096f417d2667966d0e33460e9e308f25f67

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
      bash \
      ca-certificates \
      curl \
      git \
    && \
    rm -rf /var/lib/apt/lists/*

# Install the official launcher directly instead of executing a remote shell script.
RUN curl --fail --show-error --silent --location \
      --proto '=https' --tlsv1.2 \
      https://trunk.io/releases/trunk \
      --output /usr/local/bin/trunk && \
    chmod 0755 /usr/local/bin/trunk && \
    trunk --version

RUN useradd --create-home --uid 10001 --shell /bin/bash trunk

USER trunk
WORKDIR /workspace

CMD ["trunk", "--help"]
