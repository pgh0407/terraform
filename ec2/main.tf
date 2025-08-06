provider "aws" {
 region = "ap-northeast-2"
}

resource "aws_instance" "web" {
 ami = var.ami_id
 instance_type = var.instance_type
 tags = {
   Name = "pgh-Terraform-Web2"
 }
}
