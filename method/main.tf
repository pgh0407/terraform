variable "prod" {
  description = "배포 환경 이름"
  type        = string
  default     = "local"
}

variable "ami_map" {
  description = "환경별 AMI 매핑"
  type = map(string)
  default = {
    dev     = "ami-aaabbb"
    staging = "ami-cccddd"
    prod    = "ami-fffeee"
    local   = "ami-ghghgh"
  }
}

variable "regions" {
  description = "허용된 리전 리스트"
  type        = list(string)
  default     = []
}

variable "optional_value" {
  description = "옵션 값 (비워둘 수 있음)"
  type        = string
  default     = ""
}

output "selected_ami" {
  description = "선택된 AMI (lookup)"
  value       = lookup(var.ami_map, var.prod, "ami-default")
}

output "is_ap_allowed" {
  description = "서울 리전 허용 여부 (contains)"
  value       = contains(var.regions, "ap-northeast-2")
}

output "region_count" {
  description = "지정된 리전 수 (length)"
  value       = length(var.regions)
}

output "clean_regions" {
  description = "빈 문자열 제거한 리전 리스트 (compact)"
  value       = compact(var.regions)
}

output "final_value" {
  description = "옵션 값이 없을 경우 기본값 반환 (coalesce)"
  value       = coalesce(var.optional_value, "Hello")
}

output "safe_lookup" {
  description = "can으로 키 존재 여부 체크"
  value       = can(var.ami_map["local"]) ? var.ami_map["local"] : "없음"
}

output "safe_try" {
  description = "try로 키가 없을 경우 기본값 반환"
  value       = try(var.ami_map["local"], "기본값")
}
