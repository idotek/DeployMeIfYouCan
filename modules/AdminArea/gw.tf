resource "aws_internet_gateway" "AdminArea-Gw" {
  vpc_id = aws_vpc.AdminArea-VPC.id

  tags = {
    Name = var.Gateway_Name
  }
}

resource "aws_route_table" "AdminArea-Route" {
  vpc_id = aws_vpc.AdminArea-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.AdminArea-Gw.id
  }

  route {
    cidr_block = var.VPC.Subnet
    gateway_id = "local"
  }
  tags = {
    Name = var.Routing_Name
  }
}

resource "aws_main_route_table_association" "AdminArea-RouteAndVPC" {
  vpc_id         = aws_vpc.AdminArea-VPC.id
  route_table_id = aws_route_table.AdminArea-Route.id

}

