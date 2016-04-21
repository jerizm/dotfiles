if hash docker 2>/dev/null; then
  alias mc='docker-machine'
  alias dl='docker ps -l -q'
  alias dbash='docker exec -it $(dl) /bin/bash'
fi
