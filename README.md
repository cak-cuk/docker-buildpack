# Base Image


[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/cak-cuk/docker-buildpack/main.svg)](https://results.pre-commit.ci/latest/github/cak-cuk/docker-buildpack/main)
 [![CI/CD](https://github.com/cak-cuk/docker-buildpack/actions/workflows/ci.yml/badge.svg)](https://github.com/cak-cuk/docker-buildpack/actions/workflows/ci.yml) [![Docker Stars](https://img.shields.io/docker/stars/udienz/buildpack.svg?maxAge=2592000)](https://hub.docker.com/r/udienz/buildpack/) [![Docker Pulls](https://img.shields.io/docker/pulls/udienz/buildpack.svg?maxAge=2592000)](https://hub.docker.com/r/udienz/buildpack/)

Base images for building packages. Each image contains a build toolchain and common version control clients:
git, subversion, bazaar (`bzr`), mercurial, cvs, plus `sudo`, `wget` and `ca-certificates`.
Alpine uses `build-base`, CentOS, AlmaLinux and Rocky Linux use the "Development Tools" group (`bzr` is not available on AlmaLinux and Rocky Linux), Debian and Ubuntu use `build-essential`.

## Available distro:
- Ubuntu (18.04, 20.04, 22.04, 24.04 and 26.04)
- Debian (11, 12 and 13)
- AlmaLinux (9 and 10)
- Rocky Linux (9 and 10)
- Alpine (latest and edge)

Obsolete (end of life, kept as is, no longer rebuilt by CI): CentOS 8, Debian 8, 9 and 10, Ubuntu 12.04, 14.04 and 16.04.
CentOS 5, 6 and 7 have been removed.

Usage:

```
docker pull udienz/buildpack:ubuntu2404
```

Images are published to [Docker Hub](https://hub.docker.com/r/udienz/buildpack/). CI rebuilds and pushes the distros in the matrix of [`ci.yml`](.github/workflows/ci.yml) every Sunday and on every push to `main`.

### Supported tag and respective `Dockerfile` links
Here is the tag lists
 - [`docker-buildpack:centos8`](https://github.com/cak-cuk/docker-buildpack/blob/main/centos8/Dockerfile) (obsolete)
 - [`docker-buildpack:alpine-edge`](https://github.com/cak-cuk/docker-buildpack/tree/main/alpine-edge)
 - [`docker-buildpack:alpine-latest`](https://github.com/cak-cuk/docker-buildpack/tree/main/alpine-latest)
 - [`docker-buildpack:almalinux9`](https://github.com/cak-cuk/docker-buildpack/blob/main/almalinux9/Dockerfile)
 - [`docker-buildpack:almalinux10`](https://github.com/cak-cuk/docker-buildpack/blob/main/almalinux10/Dockerfile)
 - [`docker-buildpack:rockylinux9`](https://github.com/cak-cuk/docker-buildpack/blob/main/rockylinux9/Dockerfile)
 - [`docker-buildpack:rockylinux10`](https://github.com/cak-cuk/docker-buildpack/blob/main/rockylinux10/Dockerfile)
 - [`docker-buildpack:debian8`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian8/Dockerfile) (obsolete)
 - [`docker-buildpack:debian9`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian9/Dockerfile) (obsolete)
 - [`docker-buildpack:debian10`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian10/Dockerfile) (obsolete)
 - [`docker-buildpack:debian11`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian11/Dockerfile)
 - [`docker-buildpack:debian12`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian12/Dockerfile)
 - [`docker-buildpack:debian13`](https://github.com/cak-cuk/docker-buildpack/blob/main/debian13/Dockerfile)
 - [`docker-buildpack:ubuntu1204`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu1204) (obsolete)
 - [`docker-buildpack:ubuntu1404`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu1404) (obsolete)
 - [`docker-buildpack:ubuntu1604`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu1604) (obsolete)
 - [`docker-buildpack:ubuntu1804`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu1804)
 - [`docker-buildpack:ubuntu2004`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu2004)
 - [`docker-buildpack:ubuntu2204`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu2204)
 - [`docker-buildpack:ubuntu2404`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu2404)
 - [`docker-buildpack:ubuntu2604`](https://github.com/cak-cuk/docker-buildpack/tree/main/ubuntu2604)
