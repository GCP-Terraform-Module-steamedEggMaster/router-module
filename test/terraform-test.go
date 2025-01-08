package test

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestGoogleComputeRouterModule(t *testing.T) {
	// Terraform 옵션 설정
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/with-vpc", // Terraform 루트 모듈 경로

		Vars: map[string]interface{}{
			"vpc_network_name": "test-vpc",
			"router_name":      "test-router",
			"router_region":    "asia-northeast3",
		},
	}

	// Terraform Init 및 Apply 실행
	defer terraform.Destroy(t, terraformOptions) // 테스트 종료 후 리소스 정리
	terraform.InitAndApply(t, terraformOptions)

	// VPC 출력값 확인
	networkID := terraform.Output(t, terraformOptions, "network_id")
	assert.NotEmpty(t, networkID, "VPC Network ID should not be empty")

	// Router 출력값 확인
	routerID := terraform.Output(t, terraformOptions, "router_id")
	assert.NotEmpty(t, routerID, "Router ID should not be empty")
}
