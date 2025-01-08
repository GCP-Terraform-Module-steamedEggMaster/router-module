module "vpc" {
  source  = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/vpc-module.git?ref=v1.0.0"

  vpc_network_name = var.vpc_network_name
}

module "router" {
    source = "../../"
    
    router_name    = var.router_name
    router_region  = var.router_region
    network_id     = module.vpc.network_id
}