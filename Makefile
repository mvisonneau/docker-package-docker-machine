VERSION      ?= v0.12.2
DOWNLOAD_URL ?= https://github.com/docker/machine/releases/download
KERNEL       ?= Linux
ARCH         ?= x86_64

deb: ## Build a deb package of docker-machine binary
	curl -s -X GET "${DOWNLOAD_URL}/${VERSION}/docker-machine-${KERNEL}-${ARCH}" -o docker-machine
	chmod +x docker-machine
	fpm -s dir -t deb -a all \
	-n docker-machine \
	-v ${VERSION} \
	--deb-no-default-config-files \
	--description "Docker Machine - https://docs.docker.com/machine/overview" \
	--deb-user root \
	--deb-group root \
	--prefix /usr/local/bin \
	--package /opt/release \
	docker-machine

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: deb help
.DEFAULT_GOAL := help
