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

variable "load_balancer_name" {
  description = "The name of the Load Balancer"
  type        = string
  default     = "lb-fastfood"
}
