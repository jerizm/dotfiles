export AWS_IAM_USERNAME=jerrywang && export AWS_IAM_ACCOUNT=606908476386
export NPM_TOKEN=499e8288-82f0-4ecd-93fe-d5f1192f1736
export GITHUB_TOKEN=498c4370ae35431d9e529dff81ba21297004f246
export AWS_REGION=us-east-1

ssh-add -l | grep -q hiatus || ssh-add ~/.ssh/hiatus_rsa
