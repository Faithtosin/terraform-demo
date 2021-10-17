variable "asg-name" {
  type        = string
  description = "name to use for autoscaling group resource."
  default     = "somename"
}

variable "max-size" {
  type        = number
  description = "number, maximum number of instances the autoscaling group can spin up."
  default     = 4
}

variable "min-size" {
  type        = number
  description = "number, minimum number of instances the autoscaling group can spin up."
  default     = 2
}

variable "health-check-grace-period" {
  type        = number
  description = "choose the health-check-grace-period"
  default     = 300
}


variable "health-check-type" {
  type        = string
  description = "health check type can be Amazon EC2, Elastic Load Balancing (ELB), or a custom health check."
  default     = "ELB"
}

variable "desired-capacity" {
  type        = number
  description = "number, desired number of instances that should be running on the autoscaling group."
  default     = 3
}
variable "launch_configuration_id" {
  type        = string
  description = "launch configuration id"
}

variable "subnets" {
  type        = list(string)
  description = "list of subnets to associate with autoscalling group."
  default     = ["subnet-04d9ba157b61c1802"]
}

