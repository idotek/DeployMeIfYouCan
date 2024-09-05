data "aws_ssm_parameter" "Remote_VPC" {
  name = var.Workspace == "Lab" ? "/vpc/id/LAB_VPC_${var.ProjectName}" : "/vpc/id/PROD_VPC${var.ProjectName}"
}

resource "aws_vpc_peering_connection" "VPC-Peering" {
  vpc_id = aws_vpc.AdminArea-VPC.id
  peer_vpc_id = data.aws_ssm_parameter.Remote_VPC.value
  auto_accept = true
}
