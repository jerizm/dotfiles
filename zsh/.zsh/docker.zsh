alias mc='docker-machine'
alias docker-env='mc start dev &&  eval "$(mc env dev)"'
docker_running=$(mc status dev)

if [[ $docker_running == *"Stopped"* ]] 
then 
  echo 'docker is not running'
elif [[ $docker_running == *"Running"* ]]
then 
  echo 'Running eval "$(mc env dev)"'
  eval "$(mc env dev)"
fi
