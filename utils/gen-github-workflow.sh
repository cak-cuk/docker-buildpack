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
  build:
    runs-on: [\"self-hosted\"]
    steps: 
    - name: Checkout
      uses: actions/checkout@master
      
    - name: lint
      uses: luke142367/Docker-Lint-Action@v1.0.0
      with:
        target: $x/Dockerfile
      env:
        GITHUB_TOKEN: \${{ secrets.GH_TOKEN }}
" > $LINT

	OUT=.github/workflows/$x.yml
  echo "name: Build $x docker image
on:
  push:
    branches: [ \"main\", \"master\" ]

jobs:
  build:
    runs-on: [\"self-hosted\"]
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
