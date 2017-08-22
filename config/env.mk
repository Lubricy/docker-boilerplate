# GENERAL
CURRENT_DIR       = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CACHE_DIR         = ./.cache

# DOCKER
DOCKER_DIR     = ./docker
DOCKER_FILE    = $(DOCKER_DIR)/Dockerfile
COMPOSE_FILE   = $(DOCKER_DIR)/docker-compose.yml
