# GENERAL
PROXY             = http_proxy=$(http_proxy) https_proxy=$(https_proxy)
CURRENT_DIR       = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME      = $(lastword $(subst /, , $(CURRENT_DIR)))
PROJECT_NAMESPACE = $(PROJECT_NAME)
CACHE_DIR         = ./.cache

# DOCKER
DOCKER         = docker
REGISTRY       = docker.io
REPO           = $(REGISTRY)/$(PROJECT_NAMESPACE)/$(PROJECT_NAME)
CONTAINER_NAME = $(PROJECT_NAME)
TAG            = latest
DOCKER_DIR     = ./docker
STACK          = $(PROJECT_NAMESPACE)
BUILD_ARGS     = $(PROXY)
ENV            = $(PROXY)

# RUNTIME
PORTS    = #5000:5000
VOLUMES  = $(PWD):/opt/app
ENV 	  +=
OPT      =
