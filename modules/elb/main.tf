resource "aws_elb" "this" {
  name               = var.elb_name
  availability_zones = var.availability_zones
  subnets            = var.subnets

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    port              = 80
    protocol          = "HTTP"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = var.tags

  instances = var.instance_ids
}


