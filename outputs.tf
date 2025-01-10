output "name" {
  description = "생성된 Router의 이름"
  value       = google_compute_router.router.name
}

output "self_link" {
  description = "생성된 Router 리소스의 URI"
  value       = google_compute_router.router.self_link
}

output "id" {
  description = "생성된 Router 리소스의 고유 식별자"
  value       = google_compute_router.router.id
}

output "region" {
  description = "생성된 Router가 위치한 GCP 리전"
  value       = google_compute_router.router.region
}

output "network" {
  description = "생성된 Router가 속한 네트워크"
  value       = google_compute_router.router.network
}

output "creation_timestamp" {
  description = "Router 리소스 생성 시간 (RFC3339 형식)"
  value       = google_compute_router.router.creation_timestamp
}

output "project" {
  description = "Router가 속한 GCP 프로젝트 ID"
  value       = google_compute_router.router.project
}