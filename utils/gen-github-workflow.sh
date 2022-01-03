#!/bin/bash

set -x 
BASE=$CI_PROJECT_DIR
DISTRO="centos7 centos8 trusty xenial bionic focal jessie stretch buster alpine-edge alpine-latest bullseye bookworm"
# OUT=../.gitlab-ci.yml

for x in $DISTRO
	do
	PR=.github/workflows/$x-PR.yml
  echo "name: Check $x Dockerfile for PR
on:
  pull_request:
    branches-ignore:
      - \"master\"

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
        
" > $PR

	LINT=.github/workflows/$x-lint.yml
  echo "name: Check $x Dockerfile
on:
  push:
    branches-ignore:
      - \"master\"

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

  create-pull-request:
    name: create-pull-request
    needs: hadolint
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v2.3.4
        
      - name: Create Pull Request
        id: open-pr
        uses: repo-sync/pull-request@v2
        with:
          destination_branch: \"master\"
          pr_title: \"[DRAFT] pull_request\"
          pr_body: \"PR Request from \${{ github.event_name }} event to \${{ github.ref }}.\"
          github_token: \${{ secrets.GH_TOKEN }}

" > $LINT

	OUT=.github/workflows/$x.yml
  echo "name: Build $x docker image
on:
  push:
    branches: [ \"main\", \"master\" ]
  schedule:
    - cron: '0 1 */15 * *'

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
