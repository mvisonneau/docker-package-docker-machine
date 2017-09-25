# mvisonneau/package-docker-machine

This repository can be used in order to build a `deb` package of [docker-machine](https://docs.docker.com/machine/install-machine/)

# Usage

```bash
docker run -it --rm -v ~/:/opt/release mvisonneau/package-docker-machine make deb
```

or with more custom options:  

```bash
docker run -it --rm \
-v ~/:/opt/release \
-e VERSION=0.12.2 \
-e DOWNLOAD_URL="https://custom.location"
-e KERNEL=Linux \
-e ARCH=x86_64 \
mvisonneau/package-docker-machine make deb
```

The package will automatically be placed on your local disk.

# Development

1. Clone this repository
2. Build the container

```bash
docker build -t <your_namespace>/package-docker-machine .
```
