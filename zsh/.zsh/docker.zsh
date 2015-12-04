alias mc='docker-machine'
alias docker-env='eval "$(mc env dev)"'
docker_running=$(mc status dev)

if [[ $docker_running == *"Stopped"* ]] 
then 
  echo 'starting docker '
  { mc start dev } &
elif [[ $docker_running == *"Running"* ]]
then 
  eval "$(mc env dev)"
fi
