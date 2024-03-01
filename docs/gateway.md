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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `any` | n/a | yes |
| <a name="input_listner_arn"></a> [listner\_arn](#input\_listner\_arn) | ARN of the Load Balancer listener | `string` | n/a | yes |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | The ID of the private subnet in the first availability zone | `string` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | The ID of the private subnet in the second availability zone | `string` | n/a | yes |
| <a name="input_private_subnet_1c"></a> [private\_subnet\_1c](#input\_private\_subnet\_1c) | The ID of the private subnet in the third availability zone | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The default region to use for AWS | `string` | `"us-east-1"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_apigatewayv2_api.api_gtw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api) | resource |
| [aws_apigatewayv2_integration.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration) | resource |
| [aws_apigatewayv2_route.get_echo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route) | resource |
| [aws_apigatewayv2_stage.prd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage) | resource |
| [aws_apigatewayv2_vpc_link.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_vpc_link) | resource |
| [aws_security_group.vpc_link](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->