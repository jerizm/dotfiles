cluster_arn() {
  aws ecs list-clusters | grep $1 | tr -d ' "'
}
ecs_service_name() {
  aws ecs list-services --cluster $(cluster_arn $1) | grep $2 | tr -d ' ",'
}
update_service() {
  aws ecs update-service --cluster $(cluster_arn $1) --service $(ecs_service_name $1 $2) $3 $4
}
describe_ecs_services() {
  aws ecs describe-services --services $(ecs_service_name $1 $2) --cluster $(cluster_arn $1)
}
list_ecs_tasks() {
  aws ecs list-tasks --service-name $(ecs_service_name $1 $2) --cluster $(cluster_arn $1) | jq '.taskArns | .[] | sub(".*:task/"; "")' | tr -d '"'
}
get_ecs_task() {
  aws ecs describe-tasks --tasks $(list_ecs_tasks $1 $2) --cluster $(cluster_arn $1) | jq '.tasks[0].taskDefinitionArn' | tr -d '"'
}
describe_task_def() {
  aws ecs describe-task-definition --task-definition $(get_ecs_task $1 $2)
}
