# docker-trunk-ubuntu

> Docker image with trunk.io for quick code checks

[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/g3rhard/docker-trunk-ubuntu/build.yml?branch=production&style=for-the-badge&logo=github&color=333333)](https://github.com/g3rhard/docker-trunk-ubuntu/actions/workflows/build.yml)
[![Docker Image Version](https://img.shields.io/docker/v/g3rhard/docker-trunk-ubuntu?style=for-the-badge&logo=docker&logoColor=white&color=333333)](https://hub.docker.com/r/g3rhard/docker-trunk-ubuntu)

## Usage example

```sh
docker run --rm \
  --volume "$(pwd):/workspace" \
  --workdir /workspace \
  g3rhard/docker-trunk-ubuntu trunk check
```

The container runs as an unprivileged user. This command mounts the current repository and runs
Trunk checks without granting the container root privileges.
