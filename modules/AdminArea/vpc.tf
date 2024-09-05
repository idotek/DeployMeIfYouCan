resource "aws_vpc" "AdminArea-VPC" {
  cidr_block = var.VPC.Subnet
  tags = {
    Name = var.VPC.Name
  }
}

