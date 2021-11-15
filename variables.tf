
variable "env" {
  type    = string
  default = "dev"
}

variable "project_prefix" {
  type    = string
  default = "chaining"
}

variable "vpc-id" {
  description = "exisiting vpc-id which will be associated with the loadbalancer"
  
}

variable "subnets-list" {
  type        = list(string)
  description = "subnet ids to be associated  with the load balancer"
}