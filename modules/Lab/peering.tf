resource "aws_vpc_peering_connection" "Lab-Peering_To_Admin" {
  vpc_id = aws_vpc.Lab-VPC.id
  peer_vpc_id = var.AdminArea-VPC-ID
  auto_accept = true
}