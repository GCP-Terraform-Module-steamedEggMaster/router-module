resource "google_compute_router" "router" {
  name = var.router_name      # 라우터 이름
  region = var.router_region  # 지역 설정
  network = var.network_id    # 네트워크 ID
}