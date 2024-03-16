module "gateway" {
  source = "./modules/gateway"

  region       = var.region
  cluster_name = var.cluster_name

  vpc_id = var.vpc_id

  api_alb_listener_arn = var.api_alb_listener_arn

  private_subnets = var.private_subnets
}
