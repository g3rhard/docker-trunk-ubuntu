# docker-trunk-ubuntu

> Docker image with trunk.io for quick code checks

[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/g3rhard/docker-trunk-ubuntu/build.yml?branch=production&style=for-the-badge&logo=github&color=333333)](https://github.com/g3rhard/docker-trunk-ubuntu/actions/workflows/build.yml)
[![GHCR Image](https://img.shields.io/badge/ghcr.io-container-333333?style=for-the-badge&logo=github)](https://github.com/g3rhard/docker-trunk-ubuntu/pkgs/container/docker-trunk-ubuntu)
[![Docker Hub Mirror](https://img.shields.io/docker/v/g3rhard/docker-trunk-ubuntu?style=for-the-badge&logo=docker&logoColor=white&color=333333)](https://hub.docker.com/r/g3rhard/docker-trunk-ubuntu)

## Usage example

```sh
docker run --rm \
  --volume "$(pwd):/workspace" \
  --workdir /workspace \
  ghcr.io/g3rhard/docker-trunk-ubuntu:nightly trunk check
```

The container runs as an unprivileged user. This command mounts the current repository and runs
Trunk checks without granting the container root privileges.

The image is published primarily to GHCR. A compatibility mirror remains available at
`g3rhard/docker-trunk-ubuntu:production` on Docker Hub during the migration period.

The `nightly` tag is rebuilt every day. The `production` and `latest` tags are promoted from the
same tested multi-platform manifest on the first day of each month, or manually from GitHub Actions.
