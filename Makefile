include config/env.mk
include env_make

.PHONY: all build exec run dev push test

all:
	$(MAKE) exec CMD="echo yay! it\'s working"

env_make: config/env_make.example.mk
	@cp $? $@

build: $(CACHE_DIR)/.built
$(CACHE_DIR)/.built: $(DOCKER_FILE) .dockerignore
	@mkdir -p $(CACHE_DIR)
	$(DOCKER) build -t $(REPO):$(TAG) $(foreach arg, $(BUILD_ARGS), --build-arg $(arg)) -f $(DOCKER_FILE) .
	touch $@

up: run 
run: $(CACHE_DIR)/.running
$(CACHE_DIR)/.running: $(CACHE_DIR)/.built
	$(DOCKER) run --rm -t -d --name $(CONTAINER_NAME) \
	$(foreach port, $(PORTS), -p $(port)) \
	$(foreach vol, $(VOLUMES), -v $(vol)) \
	$(foreach env, $(ENV), -e $(env)) \
	$(foreach opt, $(OPT), $(opt)) \
	$(REPO):$(TAG) $(RUN_CMD) \
	> $@

log: run
	$(DOCKER) logs --follow $(CONTAINER_NAME)

exec: run
	$(DOCKER) exec -i -t $(foreach env, $(ENV), -e $(env)) $(CONTAINER_NAME) $(CMD)

down: stop
stop: $(CACHE_DIR)/.running
	@rm $<
	$(DOCKER) stop $(CONTAINER_NAME)

push: build
	$(DOCKER) push $(REPO):$(TAG)


deploy: build
	IMAGE_NAME=$(REPO) $(DOCKER) $(CONNECT_OPTS) $(HOST) stack deploy -c $(COMPOSE_FILE) $(STACK)
