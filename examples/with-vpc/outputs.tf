output "network_id" {
  value       = module.vpc.network_id
  description = "The network ID from the VPC module"
}

output "router_id" {
  value       = module.router.router_id
  description = "The network ID from the VPC module"
}

output "router_name" {
  value       = module.router.router_name
  description = "생성된 라우터의 이름"
}

output "router_self_link" {
  value       = module.router.router_self_link
  description = "생성된 라우터의 self-link"
}

output "router_region" {
  value       = module.router.router_region
  description = "생성된 라우터가 위치한 지역"
}

output "router_network" {
  value       = module.router.router_network
  description = "생성된 라우터가 속한 네트워크"
}