<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | n/a | yes |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | The name of the Load Balancer | `string` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_integration.proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_method.proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_resource.proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_vpc_link.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_vpc_link) | resource |
| [aws_lb.lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lb) | data source |
## Outputs

No outputs.
<!-- END_TF_DOCS -->