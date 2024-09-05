
resource "aws_security_group" "Lab-WebNSG" {
  name        = "${var.ProjectName} WebNsg"
  description = "${var.ProjectName} WebNsg"
  vpc_id      = aws_vpc.Lab-VPC.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.AdminArea-Subnet]
  }

  ingress {
    description = "Web"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.Lab-VPC.cidr_block]
  }

  ingress {
    description = "icmp"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}


resource "aws_security_group" "Lab-LbNSG" {
  name        = "${var.ProjectName} LabNsg"
  description = "${var.ProjectName} LabNsg"
  vpc_id      = aws_vpc.Lab-VPC.id
  ingress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.IPSSI-IPv4]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}