terraform {
  required_version = " >= 0.12"
}



resource "aws_lb" "test-alb" {
  name               = var.alb-name
  internal           = false
  load_balancer_type = var.lbtype
  vpc_id             = var.vpc-id

}



resource "aws_lb_listener" "test_listener" {
  load_balancer_arn = aws_lb.test-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }
  depends_on = [aws_lb_target_group.test-tg
  ]
}

resource "aws_lb_listener_rule" "test_rule" {
  listener_arn = aws_lb_listener.test_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }

  condition {
    path_pattern {
      values = ["/test/*"]
    }
  }
  depends_on = [aws_lb_target_group.test-tg, aws_lb_listener_rule.test_rule
  ]
}

resource "aws_lb_target_group" "test-tg" {
  name     = var.targetgroup
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-ip
}



resource "aws_autoscaling_attachment" "alb-attachment-asg" {
  alb_target_group_arn   = aws_lb_target_group.test-tg.arn
  autoscaling_group_name = var.asg_id
}


# for instance attachment
resource "aws_lb_target_group_attachment" "alb-attachment-instance" {
  target_group_arn = aws_lb_target_group.test-tg.arn
  target_id        = aws_instance.test.id
  port             = 80
}


