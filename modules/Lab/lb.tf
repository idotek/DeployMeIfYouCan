resource "aws_elb" "Lab-LB" {
  name            = "${var.ProjectName}-LB"
  subnets         = [aws_subnet.Lab-Subnet["AZ-A"].id, aws_subnet.Lab-Subnet["AZ-B"].id, aws_subnet.Lab-Subnet["AZ-C"].id]
  security_groups = [aws_security_group.Lab-LbNSG.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [aws_instance.Lab-Instances["AZ-A-Machine"].id, aws_instance.Lab-Instances["AZ-B-Machine"].id, aws_instance.Lab-Instances["AZ-C-Machine"].id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "${var.ProjectName}-LB"
  }
}

