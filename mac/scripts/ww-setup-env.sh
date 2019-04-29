#!/usr/bin/env bash

docker-machine ls
docker-machine start club
eval $(docker-machine env club)
cd $HOME/projects/club
docker-compose up -d
docker-machine ls
#alias v='vim "$(fzf)"'

# docker-machine env club
