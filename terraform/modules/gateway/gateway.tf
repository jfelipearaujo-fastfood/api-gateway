data "aws_elb" "elb" {
  #name = "a8be9f25ae60a42d39d997912fa98787"
  name = "a7cd51bc294aa4ce6b87bd77b752fa48"
}

# resource "aws_api_gateway_vpc_link" "main" {
#   name        = "vpc-link-${var.cluster_name}"
#   target_arns = [data.aws_lb.lb.arn]
# }

resource "aws_api_gateway_rest_api" "main" {
  name = "api-gtw-${var.cluster_name}"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
