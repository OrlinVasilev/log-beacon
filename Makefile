REGISTRY  = orlix
IMAGE     = log-beacon
TAG      ?= latest

DOCKER_BUILD_ARGS ?=

build-image:
	DOCKER_CONTENT_TRUST="" docker build $(DOCKER_BUILD_ARGS) -t $(REGISTRY)/$(IMAGE):$(TAG) .

guess-tag:
	@echo "TAG=v`git rev-parse --short HEAD`"

push-image: build-image
	docker push $(REGISTRY)/$(IMAGE):$(TAG)
	make update-pushlog

update-pushlog:
	@test -n "${PUSHLOG_DIR}" && echo "$(REGISTRY)/$(IMAGE):$(TAG)" > "${PUSHLOG_DIR}/`echo "$(REGISTRY)/$(IMAGE):$(TAG)" | sha1sum | head -c 40`"

dev-run: build-image
	docker run -d \
		--name log-beacon \
	$(REGISTRY)/$(IMAGE):$(TAG)

shell:
	docker run -ti \
		--entrypoint /bin/bash \
	$(REGISTRY)/$(IMAGE):$(TAG)
