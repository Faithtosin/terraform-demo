
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
  default     = "vpc-810abefc"
}

variable "subnets-list" {
  type        = list(string)
  description = "subnet ids to be associated  with the load balancer"
  default     = ["subnet-b50f24f8", "subnet-20e14f11", "subnet-c84dd6ae"]
}