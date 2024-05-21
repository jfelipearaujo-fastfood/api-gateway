data "aws_lambda_function" "lambda_authorizer" {
  function_name = "lambda_authorizer"
}

resource "aws_api_gateway_authorizer" "authorizer" {
  name            = "jwt-authorizer"
  type            = "REQUEST"
  rest_api_id     = aws_api_gateway_rest_api.main.id
  authorizer_uri  = data.aws_lambda_function.lambda_authorizer.invoke_arn
  identity_source = "method.request.header.Authorization"

  depends_on = [
    aws_api_gateway_rest_api.main
  ]
}

data "aws_caller_identity" "current" {}

resource "aws_lambda_permission" "api_gtw_lambda_authorizer_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.lambda_authorizer.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:us-east-1:${data.aws_caller_identity.current.id}:${aws_api_gateway_rest_api.main.id}/authorizers/${aws_api_gateway_authorizer.authorizer.id}"

  depends_on = [
    aws_api_gateway_rest_api.main,
    aws_api_gateway_authorizer.authorizer
  ]
}
