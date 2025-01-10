module "vpc" {
  source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/vpc-module.git?ref=v1.0.0"

  vpc_network_name = "test-vpc"
}

module "router" {
  source = "../../" # 로컬 모듈 경로 또는 Git 저장소 URL

  # 필수 변수
  name    = "test-router"
  network = module.vpc.id

  # 선택적 변수
  description                   = "Example Google Compute Router"
  encrypted_interconnect_router = true
  region                        = "asia-northeast3"

  # Timeout 설정
  timeout_create = "15m"
  timeout_update = "10m"
  timeout_delete = "5m"
}