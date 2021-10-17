




module "lc" {
  source  = "./modules/lc"
}

module "asg" {
  source  = "./modules/asg"
}

module "alb" {
  depends_on = [module.lc, module.asg ]
  source  = "./modules/alb"
  launch_configuration_id = module.lc.id
  asg_id = module.asg.id
}

