#!/bin/bash

set -x 
BASE=$CI_PROJECT_DIR
DISTRO="centos7 centos8 trusty xenial bionic focal jessie stretch buster alpine-edge alpine-latest"
# OUT=../.gitlab-ci.yml

for x in $DISTRO
	do
	LINT=.github/workflows/$x-lint.yml
  echo $x
  echo "name: Check $x Dockerfile
on: [\"push\", \"pull_request\"]

jobs:
  hadolint:
    runs-on: [\"self-hosted\"]
    steps:
    - name: Checkout
      uses: actions/checkout@master
    - name: Hadolint
      uses: hadolint/hadolint-action@v1.6.0
      with:
        dockerfile: $x/Dockerfile
        ignore: DL3008 DL3007 DL3018 DL3033
" > $LINT

	OUT=.github/workflows/$x.yml
  echo "name: Build $x docker image
on:
  push:
    branches: [ \"main\", \"master\" ]

jobs:
  hadolint:
    runs-on: [\"self-hosted\"]
    steps:
    - name: Checkout
      uses: actions/checkout@master

    - name: Hadolint
      uses: hadolint/hadolint-action@v1.6.0
      with:
        dockerfile: $x/Dockerfile

  build:
    runs-on: [\"self-hosted\"]
    needs: [\"hadolint\"]
    steps:
    - uses: actions/checkout@master
    
    - name: Build and Publish to Registry
      uses: elgohr/Publish-Docker-Github-Action@master
      with:
        name: udienz/buildpack
        username: \${{ github.actor }}
        password: \${{ secrets.DOCKER_PASSWORD }}
        dockerfile: $x/Dockerfile
        buildoptions: \"--compress --force-rm\"
        tags: \"$x\"
" > $OUT
done
