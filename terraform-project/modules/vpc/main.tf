resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "vpc-tf-pgh"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 0)
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg-tr-pgh"
  description = "Allow HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}