output "router_name" {
  description = "생성된 라우터의 이름"
  value       = google_compute_router.router.name
}

output "router_self_link" {
  description = "생성된 라우터의 self-link"
  value       = google_compute_router.router.self_link
}

output "router_id" {
  description = "생성된 라우터의 ID"
  value       = google_compute_router.router.id
}

output "router_region" {
  description = "생성된 라우터가 위치한 지역"
  value       = google_compute_router.router.region
}

output "router_network" {
  description = "생성된 라우터가 속한 네트워크"
  value       = google_compute_router.router.network
}