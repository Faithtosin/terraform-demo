variable "alb-name" {
  description = "the desired name for the load balancer"
  default     = "somename "
}

variable "security-groups-list" {
  type        = list(string)
  description = "security group ids to be associated  with the load balancer"
  default     = ["sg-xxxxxxx","sg-xxxxxxxx"]
}


variable "subnets-list" {
  type        = list(string)
  description = "subnet ids to be associated  with the load balancer"
  default     = ["subnet-xxxxxxx","subnet-xxxxxxxx"]
}



variable "lbtype" {
  description = "load balancer type, can be application , network or gateway "
  default = "application"
}

variable "vpc-id" {
  description = "exisiting vpc-id which will be associated with the loadbalancer"
  default     = "vpc-xxxxxxxx"


variable "targetgroup"
  description = "name for the target group"
  default = "somename"


