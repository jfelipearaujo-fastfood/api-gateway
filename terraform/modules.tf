module "gateway" {
  source = "./modules/gateway"

  region             = var.region
  load_balancer_name = var.load_balancer_name
  cluster_name       = var.cluster_name
}
