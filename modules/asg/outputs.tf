output "test-asg" {
  value       = aws_autoscaling_group.asg
  description = "output can be used in other modules"
}
