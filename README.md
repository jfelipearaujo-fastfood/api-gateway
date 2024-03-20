# Fast-Food API Gateway

This project its responsible for creating the API Gateway for the Fast-Food application with the following resources:

- Lambda Function for User Authentication (login)
- Lambda Function for User Registration (register)
- Lambda Function for JWT Token Validation (authorizer)
- Redirects the requests to the EKS Cluster

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.7.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.38.0 |
## Providers

No providers.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket to store the tfstate file | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | `"fastfood"` | no |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | The name of the Load Balancer | `string` | `"lb-fastfood"` | no |
| <a name="input_region"></a> [region](#input\_region) | The default region to use for AWS | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to use for AWS resources | `map(string)` | <pre>{<br>  "App": "gateway"<br>}</pre> | no |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gateway"></a> [gateway](#module\_gateway) | ./modules/gateway | n/a |
## Resources

No resources.
## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Modules

- [gateway](./docs/gateway.md)