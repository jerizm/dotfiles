#!/usr/bin/env zsh

if (( $+commands[docker] )) ; then
  alias mc='docker-machine'
  alias dl='docker ps -l -q'
  alias dbash='docker exec -it $(dl) /bin/bash'
  alias dsh='docker exec -it $(dl) /bin/sh'
  alias docker-clean='docker rm $(docker ps -a -q) && docker rmi $(docker images -q) && docker ps -a | cut -c-12 | xargs docker rm'

  # Kill all running containers.
  alias dockerkillall='docker kill $(docker ps -q)'

  # Delete all stopped containers.
  alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

  # Delete all untagged images.
  alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

  # Delete all stopped containers and untagged images.
  alias dockerclean='dockercleanc || true && dockercleani'
fi
