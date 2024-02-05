resource "aws_ecs_cluster" "nginx" {
  name = "nginx"
}

resource "aws_security_group" "nginx-sg" {
  name   = "nginx-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    self        = "false"
    cidr_blocks = ["0.0.0.0/0"] # this should be updated to company's VPN
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecs_task_definition" "nginx-task" {
  family                   = "nginx-service"
  container_definitions    = file("task-definitions/nginx.json")
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "2048"
  requires_compatibilities = ["FARGATE"]
}

resource "aws_ecs_service" "nginx-service" {
  name            = "nginx-service"
  cluster         = aws_ecs_cluster.nginx.id
  task_definition = aws_ecs_task_definition.nginx-task.id
  desired_count   = 1
  launch_type      = "FARGATE"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.nginx-sg.id]
    subnets          = var.subnet_ids
  }
}