resource "aws_subnet" "Lab-Subnet" {
  for_each = var.Subnet
  vpc_id = aws_vpc.Lab-VPC.id
  cidr_block = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  availability_zone = each.value.region

  tags = {
    Name = each.value.name
  }
}
