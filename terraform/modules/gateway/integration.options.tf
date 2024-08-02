resource "aws_api_gateway_method" "options" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "OPTIONS"
  authorization = "NONE"

  request_parameters = {
    "method.request.header.Origin"                         = false,
    "method.request.header.Access-Control-Request-Method"  = false,
    "method.request.header.Access-Control-Request-Headers" = false
  }

  depends_on = [
    aws_api_gateway_resource.proxy,
  ]
}

resource "aws_api_gateway_method_response" "options" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.options.http_method
  status_code = "200"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Origin"  = true
  }

  response_models = {
    "application/json" = "Empty"
  }

  depends_on = [
    aws_api_gateway_method.options,
  ]
}

resource "aws_api_gateway_integration" "options" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.options.http_method
  type        = "MOCK"

  integration_http_method = "OPTIONS"
  passthrough_behavior    = "WHEN_NO_MATCH"

  request_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }
}

# resource "aws_api_gateway_integration_response" "options" {
#   rest_api_id = aws_api_gateway_rest_api.main.id
#   resource_id = aws_api_gateway_resource.proxy.id
#   http_method = aws_api_gateway_method.options.http_method
#   status_code = "200"

#   response_parameters = {
#     "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
#     "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS'",
#     "method.response.header.Access-Control-Allow-Origin"  = "'*'"
#   }

#   depends_on = [
#     aws_api_gateway_method.options,
#   ]
# }
