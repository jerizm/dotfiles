cluster_arn() {
  aws ecs list-clusters | grep $1 | tr -d ' "'
}
ecs_service_name() {
  aws ecs list-services --cluster $(cluster_arn $1) | grep $2 | tr -d ' ",'
}
update_service() {
  aws ecs update-service --cluster $(cluster_arn $1) --service $(ecs_service_name $1 $2) $3 $4
}
