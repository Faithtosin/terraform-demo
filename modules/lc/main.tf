terraform {
  required_version = " >= 0.12"
}

resource "aws_launch_configuration" "test_conf" {
  name_prefix   = "terraform-lc-example-"
  image_id      = var.ami-id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }
}
