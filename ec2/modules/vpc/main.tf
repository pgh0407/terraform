module "my_vpc" {
  source = "./modules/vpc"

  vpc_name = "my-pgh-vpc"
  cidr_block = "10.13.0.0/16"
}