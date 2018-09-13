cluster_arn() {
  aws ecs list-clusters | jq '.clusterArns[] | select(. | contains("qa"))' -r
}
ecs_service_name() {
  aws ecs list-services --cluster $(cluster_arn $1) | jq ".serviceArns[] | select(. | contains(\"$2\"))" -r
}
update_service() {
  aws ecs update-service --cluster $(cluster_arn $1) --service $(ecs_service_name $1 $2) $3 $4
}
describe_ecs_services() {
  aws ecs describe-services --services $(ecs_service_name $1 $2) --cluster $(cluster_arn $1) | jq '.services[] | .events = .events[0]'
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
get_role_policies() {
  aws iam list-role-policies --role-name $1 --query 'PolicyNames[*]' | tr -d '][",' | while read line; do aws iam get-role-policy --role-name $1 --policy-name $line --query 'PolicyDocument.Statement[*]'; done
}
ecr_password() {
  aws ecr get-login --no-include-email | gsed 's/\(docker login -u AWS -p \)\|\( https.*\)//g'
}
