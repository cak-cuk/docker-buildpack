FROM ubuntu:12.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends  git subversion bzr mercurial cvs sudo build-essential wget ca-certificates \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
