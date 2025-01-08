output "network_id" {
  value = module.vpc.network_id
  description = "The network ID from the VPC module"
}

output "router_id" {
  value = module.router.router_id
  description = "The network ID from the VPC module"
}

output "router_name" {
  description = "생성된 라우터의 이름"
  value       = module.router.name
}

output "router_self_link" {
  description = "생성된 라우터의 self-link"
  value       = module.router.self_link
}

output "router_region" {
  description = "생성된 라우터가 위치한 지역"
  value       = module.router.region
}

output "router_network" {
  description = "생성된 라우터가 속한 네트워크"
  value       = module.router.network
}