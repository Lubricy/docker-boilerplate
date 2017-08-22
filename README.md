# Docker Boilerplate

as title.

## Usage

```bash
git clone https://github.com/Lubricy/docker-boilerplate my-awesome-project
cd my-awesome-project
git remote rm origin
git remote add origin git://git@my.repo:myself/awesome-project
```

## Commands

### make build
build docker image.

### make run
run docker container as a daemon.

### make up
alias for `run`.

### make log
run `docker logs --follow` for the running container.

### make exec
```bash
make exec CMD=bash
```
run bash in running container.

### make stop
stop the running container.

### make down
alias for `stop`.

### deploy
deploy to docker stack. require swarm mode.

## Variables

### config/env.mk
general settings.

### config/env_make.example.mk
project specific settings

### env_make
a copy of `config/env_make.example.mk`. convenient for tweaks.
