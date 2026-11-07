# Base Image


[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/cak-cuk/docker-buildpack/main.svg)](https://results.pre-commit.ci/latest/github/cak-cuk/docker-buildpack/main)
 [![CI/CD](https://github.com/cak-cuk/docker-buildpack/actions/workflows/ci.yml/badge.svg)](https://github.com/cak-cuk/docker-buildpack/actions/workflows/ci.yml) [![Docker Stars](https://img.shields.io/docker/stars/udienz/buildpack.svg?maxAge=2592000)](https://hub.docker.com/r/udienz/buildpack/) [![Docker Pulls](https://img.shields.io/docker/pulls/udienz/buildpack.svg?maxAge=2592000)](https://hub.docker.com/r/udienz/buildpack/)

Base images for building packages. Each image contains a build toolchain and common version control clients:
git, subversion, bazaar (`bzr`), mercurial, cvs, plus `sudo`, `wget` and `ca-certificates`.
Alpine uses `build-base`, CentOS uses the "Development Tools" group, Debian and Ubuntu use `build-essential`.

## Available distro:
- CentOS (5, 6, 7 and 8)
- Ubuntu (12.04, 14.04, 16.04, 18.04, 20.04, 22.04, 24.04 and 26.04)
- Debian (Debian 8, 9, 10, 11, 12 and 13)
- Alpine (latest and edge)

Usage:

```
docker pull udienz/buildpack:ubuntu2404
```

Images are published to [Docker Hub](https://hub.docker.com/r/udienz/buildpack/). CI rebuilds and pushes only the distros in the matrix of [`ci.yml`](.github/workflows/ci.yml) (Ubuntu 18.04 and newer, Debian 11 and newer, Alpine) every Sunday and on every push to `main`. Older tags are kept for compatibility and are not rebuilt.

### Supported tag and respective `Dockerfile` links
Here is the tag lists
 - [`docker-buildpack:centos5`](https://github.com/cak-cuk/docker-buildpack/blob/main/centos5/Dockerfile)
 - [`docker-buildpack:centos6`](https://github.com/cak-cuk/docker-buildpack/blob/main/centos6/Dockerfile)
 - [`docker-buildpack:centos7`](https://github.com/cak-cuk/docker-buildpack/blob/main/centos7/Dockerfile)
 - [`docker-buildpack:centos8`](https://github.com/cak-cuk/docker-buildpack/blob/main/centos8/Dockerfile)
 - [`docker-buildpack:alpine-edge`](https://github.com/cak-cuk/docker-buildpack/tree/main/alpine-edge)
 - [`docker-buildpack:alpine-latest`](https://github.com/cak-cuk/docker-buildpack/tree/main/alpine-latest)
 - [`docker-buildpack:debian8`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian8/Dockerfile)
 - [`docker-buildpack:debian9`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian9/Dockerfile)
 - [`docker-buildpack:debian10`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian10/Dockerfile)
 - [`docker-buildpack:debian11`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian11/Dockerfile)
 - [`docker-buildpack:debian12`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian12/Dockerfile)
 - [`docker-buildpack:debian13`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian13/Dockerfile)
 - [`docker-buildpack:ubuntu1204`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu1204)
 - [`docker-buildpack:ubuntu1404`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu1404)
 - [`docker-buildpack:ubuntu1604`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu1604)
 - [`docker-buildpack:ubuntu1804`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu1804)
 - [`docker-buildpack:ubuntu2004`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu2004)
 - [`docker-buildpack:ubuntu2204`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu2204)
 - [`docker-buildpack:ubuntu2404`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu2404)
 - [`docker-buildpack:ubuntu2604`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu2604)
