# terraform structure example

Suggested example structure of terraform. The goal is to reuse code across
stages and just put differences into config files. This works by calling the
same code and referencing different configurations for the backend and
variables.

The example contains three different implements:
* expert -> for expert users and platform team using individual modules
* simple -> for common users still leveraging HCL using one central module
* simple_yaml -> for common users using yaml as configuration using one central module

The stage configuartion can be found under `stages/$stage/`.

# Expert & Simple

## init
````
terraform init --backend-config=stages/dev/backend.tfvars
````

## apply
````
terraform apply --var-file=stages/dev/terraform.tfvars
````

## switching between stages
When switching between stages you need to remove the terraform locally
````
rm -fr .terraform
````

# Simple YAML

## init
````
terraform init --backend-config=stages/dev/backend.tfvars
````

## apply
````
terraform apply -var="config_file=stages/dev/config.yaml"
````
