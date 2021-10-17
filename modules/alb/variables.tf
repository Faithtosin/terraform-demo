variable "alb-name" {
  description = "the desired name for the load balancer"
  default     = "somename "
}


variable "asg_id" {
  description = "Autoscaling group id"
}

variable "security-groups-list" {
  type        = list(string)
  description = "security group ids to be associated  with the load balancer"
  default     = ["sg-017d151b9929060f3"]
}


variable "subnets-list" {
  type        = list(string)
  description = "subnet ids to be associated  with the load balancer"
  default     = ["subnet-0056cb89cd49ab2e4", "subnet-0ad4947b529ea6577"]
}



variable "lbtype" {
  description = "load balancer type, can be application , network or gateway "
  default     = "application"
}

variable "vpc-id" {
  description = "exisiting vpc-id which will be associated with the loadbalancer"
  default     = "vpc-087b4e0167a2591a9"
}

variable "targetgroup" {
  description = "name for the target group"
  default     = "somename"
}

