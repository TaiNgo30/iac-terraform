resource "aws_lb" "app" {
  name               = "app-lb-${var.environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.public_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "app" {
  name     = "app-tg-${var.environment}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_autoscaling_group" "app" {
  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = [aws_lb_target_group.app.arn]
}

