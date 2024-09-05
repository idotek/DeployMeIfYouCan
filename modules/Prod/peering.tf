resource "aws_vpc_peering_connection" "Prod-Peering_To_Admin" {
  vpc_id = aws_vpc.Prod-VPC.id
  peer_vpc_id = var.AdminArea-VPC-ID
  auto_accept = true
}

resource "aws_route" "Prod_To_Admin-Peering" {
  route_table_id = aws_route_table.Prod-Route.id
  destination_cidr_block = var.AdminArea-VPC-CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.Prod-Peering_To_Admin.id
}


resource "aws_route" "Admin_To_Prod-peering" {
  route_table_id = var.AdminArea-Route-id
  destination_cidr_block = aws_vpc.Prod-VPC.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.Prod-Peering_To_Admin.id
  
}