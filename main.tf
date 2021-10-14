resource "aws_ecs_cluster" "test_cluster" {
  name = variable.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}