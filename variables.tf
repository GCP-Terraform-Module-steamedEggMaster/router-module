# 필수 변수
variable "name" {
  description = "Router 이름 (RFC1035 규칙 준수)"
  type        = string
}

variable "network" {
  description = "Router가 속한 네트워크"
  type        = string
}

# 선택적 변수
variable "description" {
  description = "Router 리소스의 설명"
  type        = string
  default     = null
}

variable "encrypted_interconnect_router" {
  description = "암호화된 VLAN 첨부용 Router 여부"
  type        = bool
  default     = null
}

variable "region" {
  description = "Router가 생성될 GCP 리전"
  type        = string
  default     = null
}

variable "project" {
  description = "GCP 프로젝트 ID"
  type        = string
  default     = null
}

# BGP 설정
variable "bgp" {
  description = "BGP 정보"
  type = object({
    asn               = number
    advertise_mode    = string
    advertised_groups = list(string)
    advertised_ip_ranges = list(object({
      range       = string
      description = string
    }))
    keepalive_interval = number
    identifier_range   = string
  })
  default = null
}

# Timeout 설정
variable "timeout_create" {
  description = "Router 리소스 생성 제한 시간"
  type        = string
  default     = "20m"
}

variable "timeout_update" {
  description = "Router 리소스 업데이트 제한 시간"
  type        = string
  default     = "20m"
}

variable "timeout_delete" {
  description = "Router 리소스 삭제 제한 시간"
  type        = string
  default     = "20m"
}
