variable "router_name" {
  description = "라우터의 이름"
  type        = string
}

variable "router_region" {
  description = "라우터가 위치할 지역"
  type        = string
}

variable "network_id" {
  description = "라우터가 속할 VPC 네트워크 ID"
  type        = string
}