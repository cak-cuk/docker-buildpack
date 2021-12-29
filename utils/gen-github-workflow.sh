#!/bin/bash

set -x 
BASE=$CI_PROJECT_DIR
DISTRO="centos7 centos8 trusty xenial bionic focal jessie stretch buster alpine-edge alpine-latest"
# OUT=../.gitlab-ci.yml

for x in $DISTRO
	do
	OUT=.github/workflows/$x.yml
  echo $x
  echo "name: Build $x Docker
on:
  push:
    branches: [ "development" ]
  pull_request:
    branches: [ "master", "development", "main" ]

jobs:
  build:
    runs-on: ["self-hosted", "ubuntu-latest"]
    steps:
    - uses: actions/checkout@master
    
    - name: Publish to Registry
      uses: elgohr/Publish-Docker-Github-Action@master
      with:
        name: udienz/buildpack
        username: \${{ github.actor }}
        password: \${{ secrets.DOCKER_PASSWORD }}
        dockerfile: focal/Dockerfile
        buildoptions: \"--compress --force-rm\"
        tags: \"$x\"
" > $OUT
done
