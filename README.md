# router-module
GCP Terraform router module Repo

Google Cloud Platform(GCP)에서 라우터를 생성하고 관리하기 위한 Terraform 모듈입니다.  <br>
이 모듈은 VPC 네트워크에 연결된 라우터를 쉽게 구성할 수 있도록 설계되었습니다.

<br>

## 📑 **목차**
1. [모듈 특징](#모듈-특징)
2. [사용 방법](#사용-방법)
    1. [사전 준비](#1-사전-준비)
    2. [입력 변수](#2-입력-변수)
    3. [모듈 호출 예시](#3-모듈-호출-예시)
    4. [출력값 (Outputs)](#4-출력값-outputs)
    5. [지원 버전](#5-지원-버전)
    6. [모듈 개발 및 관리](#6-모듈-개발-및-관리)
3. [테스트](#terratest를-이용한-테스트)
4. [주요 버전 관리](#주요-버전-관리)
5. [기여](#기여-contributing)
6. [라이선스](#라이선스-license)

---

## 모듈 특징

- Google Compute Router를 간단하게 생성.
- VPC 네트워크와 연동하여 라우팅 설정 지원.
- 특정 지역에 라우터 배치 가능.
- BGP 설정 및 동적 IP 광고 지원.
- Terraform 출력값으로 생성된 라우터 정보 제공

---

## 사용 방법

### 1. 사전 준비

다음 사항을 확인하세요:
1. Google Cloud 프로젝트 준비.
2. 적절한 IAM 권한 필요: `roles/compute.networkAdmin` (라우터 관리 권한 필수).
3. VPC 네트워크를 동시에 생성하거나, 이미 생성해놓아야 함.

<br>

### 2. 입력 변수

| 변수명                       | 타입           | 필수 여부 | 기본값 | 설명                                  |
|------------------------------|----------------|-----------|--------|---------------------------------------|
| `name`                       | string         | ✅        | 없음   | 생성할 라우터의 이름                  |
| `network`                    | string         | ✅        | 없음   | 연결할 VPC 네트워크의 ID               |
| `description`                | string         | ❌        | null   | 라우터 리소스에 대한 설명              |
| `encrypted_interconnect_router` | bool          | ❌        | null   | 암호화된 VLAN 첨부용 라우터 여부        |
| `region`                     | string         | ✅        | null   | 라우터가 배치될 지역 (예: `asia-northeast3`) |
| `project`                    | string         | ❌        | null   | 라우터가 속한 GCP 프로젝트 ID (제공되지 않으면 Provider 프로젝트 사용)  |
| `bgp`                        | object         | ❌        | null   | BGP 설정 (ASN, 광고 모드 등 포함). 아래 하위 필드를 참조하세요. |
| `timeout_create`             | string         | ❌        | `"20m"`| 리소스 생성 제한 시간                  |
| `timeout_update`             | string         | ❌        | `"20m"`| 리소스 업데이트 제한 시간              |
| `timeout_delete`             | string         | ❌        | `"20m"`| 리소스 삭제 제한 시간                  |

#### `bgp` 변수 하위 필드
| 필드명                   | 타입   | 필수 여부 | 기본값          | 설명                                   |
|--------------------------|--------|-----------|-----------------|----------------------------------------|
| `asn`                    | number | ✅        | 없음            | BGP ASN 번호                            |
| `advertise_mode`         | string | ❌        | `"DEFAULT"`     | BGP 광고 모드 (`DEFAULT`, `CUSTOM`)       |
| `advertised_groups`      | list   | ❌        | `[]`            | 광고할 그룹 리스트 (`ALL_SUBNETS` 등)       |
| `advertised_ip_ranges`   | list   | ❌        | `[]`            | 광고할 IP CIDR 범위                     |
| `keepalive_interval`     | number | ❌        | 20              | BGP Keepalive Interval (초 단위)         |

<br>

### 3. 모듈 호출 예시

```hcl
module "router" {
  source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/router-module.git?ref=v1.0.0"

  name        = "custom-router"
  network     = "projects/my-project-id/global/networks/my-vpc"
  description = "Example Router"
  region      = "asia-northeast3"
  project     = "my-project-id"
  bgp = {
    asn               = 64512
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges = [
      { range = "192.168.1.0/24", description = "Example range" },
      { range = "192.168.2.0/24", description = "Another range" }
    ]
    keepalive_interval = 20
    identifier_range   = "10.1.0.0/16"
  }
}
```

<br>

### 4. 출력값 (Outputs)

| 출력명              | 설명                                    |
|---------------------|----------------------------------------|
| `name`             | 생성된 라우터의 이름                        |
| `self_link`        | 생성된 라우터의 URI                        |
| `id`               | 생성된 라우터의 고유 식별자                 |
| `region`           | 생성된 라우터가 위치한 GCP 리전              |
| `network`          | 생성된 라우터가 속한 네트워크                |
| `creation_timestamp` | 라우터 리소스 생성 시간 (RFC3339 형식)       |
| `project`          | 라우터가 속한 GCP 프로젝트 ID               |

<br>

### 5. 지원 버전

#### a.  Terraform 버전
| 버전 범위 | 설명                              |
|-----------|-----------------------------------|
| `1.10.3`   | 최신 버전, 지원 및 테스트 완료                  |

#### b. Google Provider 버전
| 버전 범위 | 설명                              |
|-----------|-----------------------------------|
| `~> 4.0`  | 최소 지원 버전                   |

<br>

### 6. 모듈 개발 및 관리

- **저장소 구조**:
  ```
  router-module/
    ├── .github/workflows/  # github actions 자동화 테스트
    ├── examples/           # 테스트를 위한 루트 모듈 모음 디렉터리
    ├── test/               # 테스트 구성 디렉터리
    ├── main.tf             # 모듈의 핵심 구현
    ├── variables.tf        # 입력 변수 정의
    ├── outputs.tf          # 출력 정의
    ├── README.md           # 문서화 파일
  ```

<br>

---

### Terratest를 이용한 테스트
이 모듈을 테스트하려면 제공된 Go 기반 테스트 프레임워크를 사용하세요. 아래를 확인하세요:

1. Terraform 및 Go 설치.
2. 필요한 환경 변수 설정.
3. 테스트 실행:
```bash
go test -v ./test
```

<br>

## 주요 버전 관리
이 모듈은 [Semantic Versioning](https://semver.org/)을 따릅니다.  
안정된 버전을 사용하려면 `?ref=<version>`을 활용하세요:

```hcl
source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/router-module.git?ref=v1.0.0"
```

### Module ref 버전
| Major | Minor | Patch |
|-----------|-----------|----------|
| `1.0.0`   |    |   |

<br>

## 기여 (Contributing)
기여를 환영합니다! 버그 제보 및 기능 요청은 GitHub Issues를 통해 제출해주세요.

<br>

## 라이선스 (License)
[MIT License](LICENSE)