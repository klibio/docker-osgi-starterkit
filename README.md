# osgi-starterkit

Build the container with 

```bash
#!/bin/bash
docker build \
  --no-cache \
  --progress=plain \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg VCS_REF=$(git rev-list -1 HEAD) \
  -t osgi-starterkit:latest \
  .
```
and run container interactively

```bash
#!/bin/bash
docker container run \
    --name osgi \
    --rm \
    -it osgi-starterkit:latest
```

execute osgi shell commands e.g.
```bash
osgi> help
...
osgi> exit
Really want to stop Equinox? (y/n; default=y)
```
