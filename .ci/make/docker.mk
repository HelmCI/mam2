DOCKER = docker --debug
D_BUILDER = buildx
D_PROGRESS = auto
# D_PROGRESS = plain
D_CMD_RUN = $(DOCKER) run --rm --name $(APP)
D_CMD_BUILD = $(DOCKER) $(D_BUILDER) build --progress=$(D_PROGRESS)
D_IMAGE = $(REG)/$(REG_NS)/$(APP):$(RT)-$(VER)
# D_CACHE = --no-cache
# D_PUSH = --load
# D_PUSH = --push
D_PLATFORM = --platform linux/arm64,linux/amd64

# NS=gd
# APP=app
# CMD=npm start
# APP=demo
# CMD=node ./gd/snap.npm/cli.mjs

build:
	$(D_CMD_BUILD) $(D_CACHE) $(D_PUSH) -t $(D_IMAGE) \
		--build-arg REG=$(REG) \
		--build-arg NODE=$(NODE) \
		--build-arg NGINX=$(NGINX) \
		--build-arg NS=$(NS) \
		--build-arg APP=$(APP) \
		--build-arg CMD="$(CMD)" \
		$(D_PLATFORM) .

D_PORT = 9088
D_NGINX = /usr/share/nginx/html
run:
	echo http://0.0.0.0:$(D_PORT)
	$(D_CMD_RUN) -p $(D_PORT):80 $(D_IMAGE)
run-ls:
	$(D_CMD_RUN) $(D_IMAGE) ls -al $(D_NGINX)
nginx:
	$(D_CMD_RUN) -p $(D_PORT):80
		-v ./${NS}/${APP}/app/-/:$(D_NGINX):ro \
		${REG}/dhub/library/nginx:${NGINX}
