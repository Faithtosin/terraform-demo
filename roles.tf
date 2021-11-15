#ECS role and policy
data "aws_iam_policy_document" "ecs_tasks_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_role" {
  name               = "${var.project_prefix}-${var.env}-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_tasks_role.json
}

resource "aws_iam_role_policy_attachment" "AmazonECS_FullAccess" {
  role       = aws_iam_role.ecs_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

data "aws_iam_policy" "ecs_task_execution_role" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ecs_role.name
  policy_arn = data.aws_iam_policy.ecs_task_execution_role.arn
}