output "network_id" {
  value       = module.vpc.id
  description = "The network ID from the VPC module"
}

output "router_name" {
  value = module.router.name
}

output "router_self_link" {
  value = module.router.self_link
}

output "router_id" {
  value = module.router.id
}

output "router_region" {
  value = module.router.region
}

output "router_network" {
  value = module.router.network
}

output "router_creation_timestamp" {
  value = module.router.creation_timestamp
}

output "router_project" {
  value = module.router.project
}
