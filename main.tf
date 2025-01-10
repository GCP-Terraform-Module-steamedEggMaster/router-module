resource "google_compute_router" "router" {
  # 필수 옵션
  name    = var.name    # Router 이름
  network = var.network # 연결된 네트워크

  # 선택적 옵션
  description                   = var.description                   # 리소스 설명 (선택)
  encrypted_interconnect_router = var.encrypted_interconnect_router # 암호화된 VLAN 첨부용 Router 여부
  region                        = var.region                        # Router 리소스가 속한 GCP 리전
  project                       = var.project                       # GCP 프로젝트 ID

  # BGP 설정
  dynamic "bgp" {
    for_each = var.bgp != null ? [var.bgp] : [] # BGP 설정이 있을 경우에만 추가
    content {
      asn                = bgp.value.asn                # BGP ASN 번호
      advertise_mode     = bgp.value.advertise_mode     # BGP 광고 모드
      advertised_groups  = bgp.value.advertised_groups  # 광고할 그룹 (예: ALL_SUBNETS)
      keepalive_interval = bgp.value.keepalive_interval # BGP Keepalive 간격 (초)
      identifier_range   = bgp.value.identifier_range   # BGP Identifier 범위

      # 광고할 IP 범위 설정
      dynamic "advertised_ip_ranges" {
        for_each = bgp.value.advertised_ip_ranges # 광고할 IP 범위가 있을 경우만 추가
        content {
          range       = advertised_ip_ranges.value.range       # 광고할 IP 범위 (CIDR)
          description = advertised_ip_ranges.value.description # 광고 범위 설명
        }
      }
    }
  }

  # Timeout 설정
  timeouts {
    create = var.timeout_create # 리소스 생성 제한 시간
    update = var.timeout_update # 리소스 업데이트 제한 시간
    delete = var.timeout_delete # 리소스 삭제 제한 시간
  }
}