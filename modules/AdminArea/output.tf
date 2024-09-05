output "AdminArea-Subnet" {
  value = aws_vpc.AdminArea-VPC.cidr_block
}

output "AdminArea-VPC-ID" {
  value = aws_vpc.AdminArea-VPC.id
}