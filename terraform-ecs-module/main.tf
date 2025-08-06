module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
}

module "alb" {
  source           = "./modules/alb"
  vpc_id           = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  container_port   = var.container_port
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = var.ecs_cluster_name
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.alb.sg_id]
  alb_tg_arn         = module.alb.target_group_arn
  container_port     = var.container_port
}
