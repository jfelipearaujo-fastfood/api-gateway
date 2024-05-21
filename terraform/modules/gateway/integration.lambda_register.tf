
resource "aws_api_gateway_resource" "proxy_lambda_register" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "register"

  depends_on = [
    aws_api_gateway_rest_api.main
  ]
}

resource "aws_api_gateway_method" "proxy_lambda_register" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.proxy_lambda_register.id
  http_method   = "ANY"
  authorization = "NONE"

  request_parameters = {
    "method.request.path.proxy"           = true
    "method.request.header.Authorization" = false
  }

  depends_on = [
    aws_api_gateway_rest_api.main,
    aws_api_gateway_resource.proxy_lambda_register
  ]
}

resource "aws_api_gateway_method_response" "proxy_lambda_register" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.proxy_lambda_register.id
  http_method = aws_api_gateway_method.proxy_lambda_register.http_method
  status_code = "200"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Origin"  = true
  }

  depends_on = [
    aws_api_gateway_rest_api.main,
    aws_api_gateway_resource.proxy_lambda_register,
    aws_api_gateway_method.proxy_lambda_register
  ]
}

resource "aws_api_gateway_integration_response" "proxy_lambda_register" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.proxy_lambda_register.id
  http_method = aws_api_gateway_method.proxy_lambda_register.http_method
  status_code = aws_api_gateway_method_response.proxy_lambda_register.status_code

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'POST,OPTIONS'",
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }

  depends_on = [
    aws_api_gateway_rest_api.main,
    aws_api_gateway_resource.proxy_lambda_register,
    aws_api_gateway_method.proxy_lambda_register,
    aws_api_gateway_method_response.proxy_lambda_register,
    aws_api_gateway_integration.lambda_register,
  ]
}

data "aws_lambda_function" "lambda_register" {
  function_name = "lambda_register"
}

resource "aws_lambda_permission" "api_gtw_lambda_register_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.lambda_register.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*/*/*"

  depends_on = [
    aws_api_gateway_rest_api.main,
  ]
}

resource "aws_api_gateway_integration" "lambda_register" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.proxy_lambda_register.id
  http_method = "ANY"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = data.aws_lambda_function.lambda_register.invoke_arn
  passthrough_behavior    = "WHEN_NO_MATCH"
  content_handling        = "CONVERT_TO_TEXT"

  request_parameters = {
    "integration.request.path.proxy"    = "method.request.path.proxy"
    "integration.request.header.Accept" = "'application/json'"
  }

  depends_on = [
    aws_api_gateway_rest_api.main,
    aws_api_gateway_resource.proxy_lambda_register,
    aws_api_gateway_method_response.proxy_lambda_register
  ]
}
