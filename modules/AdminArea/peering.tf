resource "aws_vpc_peering_connection" "VPC_peering_Lab" {
  count = var.Workspace == "Lab" ? 1: 0
  vpc_id = aws_vpc.AdminArea-VPC.id
  peer_vpc_id = var.Lab-VPC-ID
  auto_accept = true
}
resource "aws_vpc_peering_connection" "VPC_peering_Prod" {
  count = var.Workspace == "Prod" ? 1: 0
  vpc_id = aws_vpc.AdminArea-VPC.id
  peer_vpc_id = var.Prod-VPC-ID
  auto_accept = true
}