variable "region" {
  type        = string
  description = "The default region to use for AWS"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "load_balancer_name" {
  description = "The name of the Load Balancer"
  type        = string
}
