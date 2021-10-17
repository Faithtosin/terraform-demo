variable "ami-id" {
  description = "ami id to use with the launch configuration."
  default     = " ami-05f7491af5eef733a "
}

variable "instance_type" {
  description = "instance type for the launch configuration."
  default     = "t2.micro"
}
