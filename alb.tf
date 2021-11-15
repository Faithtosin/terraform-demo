resource "aws_lb" "test-alb" {
  name               = "${var.project_prefix}-${var.env}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets-list
  security_groups    = [aws_security_group.lb_sg.id]
}

resource "aws_lb_listener" "test_listener" {
  load_balancer_arn = aws_lb.test-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }
  depends_on = [aws_lb_target_group.test-tg]
}

resource "aws_lb_listener_rule" "test_rule" {
  listener_arn = aws_lb_listener.test_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
  depends_on = [aws_lb_target_group.test-tg, aws_lb_listener_rule.test_rule
  ]
}

resource "aws_lb_target_group" "test-tg" {
  name        = "${var.project_prefix}-${var.env}-targetgroup"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc-id
  target_type = "ip"
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    path                = "/"
    interval            = 30
    matcher             = "200,302"
  }
}
