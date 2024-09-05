resource "aws_vpc" "Lab-VPC" {
  cidr_block = var.VPC.Subnet
  tags = {
    Name = var.VPC.Name
  }
}

