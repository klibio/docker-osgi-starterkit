# docker-osgi-starterkit
This repo is providing the [Eclipse Equinox OSGi starter kits](https://www.eclipse.org/equinox/) inside a docker container

[![Eclipse OSGi starter kit version](https://img.shields.io/badge/Eclipse%20OSGi%20starter%20kit%20version-R--4.20--202106111600-blue)](https://download.eclipse.org/equinox/drops/R-4.20-202106111600/)

## container
[![GitHub](https://img.shields.io/github/license/klibio/docker-osgi-starterkit)](https://raw.githubusercontent.com/klibio/docker-osgi-starterkit/main/LICENSE)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/klibio/osgi-starterkit)](https://hub.docker.com/r/klibio/osgi-starterkit)
[![build and docker publish](https://github.com/klibio/docker-osgi-starterkit/actions/workflows/actions_build.yml/badge.svg)](https://github.com/klibio/docker-osgi-starterkit/actions/workflows/actions_build.yml?query=branch%3Amain)

## liveliness
[![Docker Pulls](https://img.shields.io/docker/pulls/klibio/osgi-starterkit)](https://hub.docker.com/repository/docker/klibio/osgi-starterkit)
[![OpenIssues](https://img.shields.io/github/issues-raw/klibio/docker-osgi-starterkit)](https://github.com/klibio/docker-osgi-starterkit/issues?q=is%3Aopen+is%3Aissue)
[![OpenPullRequests](https://img.shields.io/github/issues-pr-raw/klibio/docker-osgi-starterkit)](https://github.com/klibio/docker-osgi-starterkit/pulls?q=is%3Aopen+is%3Apr)

## building
```bash
#!/bin/bash
docker build \
  --no-cache \
  --progress=plain \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg VCS_REF=$(git rev-list -1 HEAD) \
  --build-arg VERSION=`cat version.txt` \
  -t klibio/osgi-starterkit:latest \
  .
```
## using interactively
```bash
#!/bin/bash
docker container run \
    --name osgi \
    --rm \
    -it klibio/osgi-starterkit:latest
```

execute osgi shell commands e.g.
```bash
osgi> help
...
osgi> exit
Really want to stop Equinox? (y/n; default=y)
```
