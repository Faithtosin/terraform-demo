
#create aws ecr repository 
resource "aws_ecr_repository" "ecr-repo" {
  name                 = "${var.project_prefix}-${var.env}-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}


resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.project_prefix}-${var.env}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}


#create log group for ecs
resource "aws_cloudwatch_log_group" "logs" {
  name = "${var.project_prefix}-${var.env}-logs"
}


#Create the task definition
resource "aws_ecs_task_definition" "Task" {
  family                   = "${var.project_prefix}-${var.env}-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024

  execution_role_arn = aws_iam_role.ecs_role.arn
  depends_on         = [aws_ecr_repository.ecr-repo]
  container_definitions = jsonencode([
    {
      name      = "${var.project_prefix}-${var.env}-container"
      image    = "nginx"
      #image     = "${aws_ecr_repository.asmt-1-cmba-ecr.repository_url}:latest"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ],

      log_configuration = [
        {
          logDriver : "awslogs",
          options : {
            awslogs-group : aws_cloudwatch_log_group.logs.name,
            awslogs-region : "us-east-1",
            awslogs-stream-prefix : "ecs"
          }
        }
      ]
    }
  ])
}

#Create the service
resource "aws_ecs_service" "service" {
  name            = "${var.project_prefix}-${var.env}-service"
  depends_on      = [aws_lb_listener.test_listener, aws_lb_target_group.test-tg]
  cluster         = aws_ecs_cluster.ecs-cluster.id
  task_definition = aws_ecs_task_definition.Task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnets-list
    security_groups  = [aws_security_group.container_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.test-tg.id
    container_name   = "${var.project_prefix}-${var.env}-container"
    container_port   = 8080
  }
}



