FROM debian:8

RUN apt-get update \
    && apt-get install -y --force-yes --no-install-recommends  git subversion bzr mercurial cvs sudo build-essential wget \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
