terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}

resource "aws_autoscaling_group" "asg" {
  name                      = var.asg-name
  max_size                  = var.max-size
  min_size                  = var.min-size
  health_check_grace_period = var.health-check-grace-period
  health_check_type         = var.health-check-type
  desired_capacity          = var.desired-capacity
  launch_configuration      = var.launch_configuration_id
  vpc_zone_identifier       = var.subnets

}

