variable "tags" {
  type        = map(string)
  description = "The default tags to use for AWS resources"
  default = {
    App = "gateway"
  }
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket to store the tfstate file"
}

variable "region" {
  type        = string
  description = "The default region to use for AWS"
  default     = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
  default     = "fastfood"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "api_alb_listener_arn" {
  description = "ARN of the API Load Balancer listener"
  type        = string
}

variable "private_subnets" {
  type        = list(string)
  description = "The IDs of the private subnets"
}
