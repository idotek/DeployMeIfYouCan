resource "aws_vpc" "Prod-VPC" {
  cidr_block = var.VPC.Subnet
  tags = {
    Name = var.VPC.Name
  }
}

