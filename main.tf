

module "alb" {
  source  = "./modules/alb"
}
module "asg" {
  source  = "./modules/asg"
}
module "lc" {
  source  = "./modules/lc"
}
