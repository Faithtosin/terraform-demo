resource "aws_lb" "test-alb" {
  name               = var.alb-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security-groups
  subnets            = var.subnets
}