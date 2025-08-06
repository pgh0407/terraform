variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
  default     = "next-dev-key"
}

variable "instance_type" {
  description = "EC2 인스턴스 타입"
  type        = string
  default     = "t2.micro"
}