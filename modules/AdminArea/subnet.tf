resource "aws_subnet" "AdminArea-Subnet" {
  vpc_id = aws_vpc.AdminArea-VPC.id
  cidr_block = var.Subnet.cidr_block
  map_public_ip_on_launch = var.Subnet.map_public_ip_on_launch
  tags = {
    Name = var.Subnet.Name
  }
}

