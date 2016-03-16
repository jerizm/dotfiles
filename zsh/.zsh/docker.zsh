if hash docker-machine 2>/dev/null; then
  alias mc='docker-machine'
  alias docker-env='mc start dev &&  eval "$(mc env dev)"'
  docker_running=$(mc status dev)

  if [[ $docker_running == *"Stopped"* ]]
  then
    echo 'docker is not running'
  elif [[ $docker_running == *"Running"* ]]
  then
    echo 'docker running type eval "$(mc env dev)"'
  fi
fi
