




module "lc" {
  source  = "./modules/lc"
}

module "asg" {
  depends_on = [module.lc ]
  source  = "./modules/asg"
  launch_configuration_id = module.lc.id
}

module "alb" {
  depends_on = [module.asg ]
  source  = "./modules/alb"
  asg_id = module.asg.id
}

