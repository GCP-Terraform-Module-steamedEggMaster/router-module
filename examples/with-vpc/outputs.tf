output "network_id" {
  value       = module.vpc.id
  description = "The unique ID of the network created by the VPC module"
}

output "router_name" {
  value       = module.router.name
  description = "The name of the router created by the Router module"
}

output "router_self_link" {
  value       = module.router.self_link
  description = "The self link of the router, which is a URL for accessing the router resource"
}

output "router_id" {
  value       = module.router.id
  description = "The unique ID of the router created by the Router module"
}

output "router_region" {
  value       = module.router.region
  description = "The region where the router is deployed"
}

output "router_network" {
  value       = module.router.network
  description = "The name of the network that the router is attached to"
}

output "router_creation_timestamp" {
  value       = module.router.creation_timestamp
  description = "The creation timestamp of the router"
}

output "router_project" {
  value       = module.router.project
  description = "The project ID where the router is created"
}
