# Terraform Workspace

```
$ cd infra

$ terraform workspace list
* default

$ terraform workspace show
default

$ terraform workspace new test
Created and switched to workspace "test"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.

$ terraform workspace new prod
Created and switched to workspace "prod"!

$ terraform workspace select test
Switched to workspace "test".

$ terraform init
...
Terraform has been successfully initialized!

$ terraform apply -var-file=$(terraform workspace show).tfvars
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

$ docker ps -a
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
10265b9c7442   11deb5530100   "/docker-entrypoint.…"   3 seconds ago        Up 2 seconds        0.0.0.0:8080->80/tcp   nginx-server-test-0

$ terraform destroy -var-file=$(terraform workspace show).tfvars
Destroy complete! Resources: 1 destroyed
```