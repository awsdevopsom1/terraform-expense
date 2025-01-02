module "vpc" {
   source = "./modules/vpc"
   vpc_cidr_block = var.vpc_cidr_block  
   env = var.env
   tags = var.tags
   public_subnets = var.public_subnets
   app_subnets = var.app_subnets
   db_subnets = var.db_subnets
   web_subnets = var.web_subnets
   azs = var.azs
   default_route_table_id = var.default_route_table_id
   default_vpc_id = var.default_vpc_id
   account_id = var.account_id
   default_vpc_cidr = var.default_vpc_cidr
}

module "rds" {
   source = "./modules/rds"
   subnets = module.vpc.db_subnets
   env = var.env
   tags = var.tags
   rds_allocated_storage = var.rds_allocated_storage
   rds_engine = var.rds_engine
   rds_engine_version = var.rds_engine_version
   rds_instance_class = var.rds_instance_class
   sg_cidrs = var.app_subnets
   vpc_id = module.vpc.vpc_id

}

module "app" {
    source = "./modules/app"
    env = var.env
    component = "backend"
    tags = var.tags
    instance_type = var.backend["instance_type"]
    instance_count = var.backend["instance_count"]
    subnets = module.vpc.app_subnets
    vpc_id = module.vpc.vpc_id
    app_port = var.backend["app_port"]
    sg_cidrs = var.app_subnets    
    bastion_node = var.bastion_node
    backend = var.backend
}


