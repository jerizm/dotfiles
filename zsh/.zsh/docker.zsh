if hash docker 2>/dev/null; then
  alias mc='docker-machine'
  alias dl='docker ps -l -q'
  alias dbash='docker exec -it $(dl) /bin/bash'
  alias docker-clean='docker rm $(docker ps -a -q) && docker rmi $(docker images -q) && docker ps -a | cut -c-12 | xargs docker rm'
fi
