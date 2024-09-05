resource "aws_internet_gateway" "Lab-Gw" {
  vpc_id = aws_vpc.Lab-VPC.id

  tags = {
    Name = "${var.ProjectName}-Gw"
  }
}

resource "aws_route_table" "Lab-Route" {
  vpc_id = aws_vpc.Lab-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Lab-Gw.id
  }

  route {
    cidr_block = var.VPC.Subnet
    gateway_id = "local"
  }
  tags = {
    Name = "${var.ProjectName}-Routing"
  }
}

resource "aws_main_route_table_association" "AdminArea-RouteAndVPC" {
  vpc_id         = aws_vpc.Lab-VPC.id
  route_table_id = aws_route_table.Lab-Route.id
}