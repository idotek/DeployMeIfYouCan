resource "aws_subnet" "Prod-Subnet" {
  for_each = var.Subnet
  vpc_id = aws_vpc.Prod-VPC.id
  cidr_block = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  availability_zone = each.value.region

  tags = {
    Name = each.value.name
  }
}
