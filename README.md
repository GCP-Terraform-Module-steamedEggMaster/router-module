# router-module
GCP Terraform router module Repo

Google Cloud Platform(GCP)에서 라우터를 생성하고 관리하기 위한 Terraform 모듈입니다.  <br>
이 모듈은 VPC 네트워크에 연결된 라우터를 쉽게 구성할 수 있도록 설계되었습니다.

---

## 📋 **모듈 특징**

- Google Compute Router를 쉽게 생성.
- VPC 네트워크와의 연동.
- GCP의 특정 지역에 라우터 배치 가능.
- Terraform 출력값으로 라우터 정보 제공:
  - 라우터 ID
  - Self-Link
  - 라우터 이름
  - 라우터가 연결된 VPC 네트워크 정보

---

## 🔧 사용 방법

### 1. 사전 준비

다음 사항을 확인하세요:
1. Google Cloud 프로젝트 준비.
2. 적절한 IAM 권한 필요: `roles/compute.networkAdmin` (라우터 관리 권한 필수).
3. VPC 네트워크를 동시에 생성하거나, 이미 생성해놓아야 함.

<br>

### 2. 입력 변수

| 변수명          | 타입   | 필수 여부 | 기본값 | 설명                                  |
|-----------------|--------|-----------|--------|---------------------------------------|
| `router_name`   | string | ✅        | 없음   | 라우터의 이름                          |
| `router_region` | string | ✅        | 없음   | 라우터가 위치할 지역 (예: `asia-northeast3`) |
| `network_id`    | string | ✅        | 없음   | 연결할 VPC 네트워크 ID                 |

<br>

### 3. 모듈 호출 예시

```hcl
module "router" {
  source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/router-module.git?ref=v1.0.0"

  router_name   = "custom-router"
  router_region = "asia-northeast3"
  network_id    = "projects/my-project-id/global/networks/my-vpc"
}
```

<br>

### 4. 출력값 (Outputs)

| 출력명                | 설명                                    |
|---------------------|----------------------------------------|    
| `router_name`       | 생성된 라우터의 이름                        |
| `router_self_link`  | 생생성된 라우터의 Self-Link                 |
| `router_id`         | 생성된 라우터의 ID                         |
| `router_region`     | 생성된 라우터가 위치한 지역                   |
| `router_network`    | 생성된 라우터가 연결된 VPC 네트워크 정보        |

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
    ├── main.tf             # 모듈의 핵심 구현
    ├── variables.tf        # 입력 변수 정의
    ├── outputs.tf          # 출력 정의
    ├── README.md           # 문서화 파일
    ├── test/               # 테스트 구성 디렉터리
    ├── examples/           # 테스트를 위한 루트 모듈 모음 디렉터리
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