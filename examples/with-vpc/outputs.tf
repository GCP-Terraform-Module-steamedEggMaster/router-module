output "network_id" {
  value = module.vpc.network_id
  description = "The network ID from the VPC module"
}

output "router_id" {
  value = module.router.router_id
  description = "The network ID from the VPC module"
}