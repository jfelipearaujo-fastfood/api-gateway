variable "region" {
  description = "The default region to use for AWS"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "api_alb_listener_arn" {
  description = "ARN of the API Load Balancer listener"
  type        = string
}

variable "private_subnets" {
  description = "The IDs of the private subnets"
  type        = list(string)
}
