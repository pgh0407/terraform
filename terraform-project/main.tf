provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.3.0.0/16"
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
  vpc_security_group_ids = [module.vpc.web_sg_id]
  key_name      = var.key_name

  tags = {
    Name = "WebServer-tf-pgh"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}