output "AdminArea-Subnet" {
  value = aws_vpc.AdminArea-VPC.cidr_block
}

output "AdminArea-VPC-ID" {
  value = aws_vpc.AdminArea-VPC.id
}
output "AdminArea-VPC-CIDR" {
  value = aws_vpc.AdminArea-VPC.cidr_block
}


output "AdminArea-Route-id" {
  value = aws_route_table.AdminArea-Route.id
}