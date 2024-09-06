module "Lab" {
  count = terraform.workspace == "Lab" ? 1 : 0
  source = "./modules/Lab" 
  AdminArea-Subnet = module.AdminArea.AdminArea-Subnet
  IPSSI-IPv4 = var.IPSSIIPv4
  AdminArea-VPC-ID = module.AdminArea.AdminArea-VPC-ID
  AdminArea-VPC-CIDR = module.AdminArea.AdminArea-VPC-CIDR
  AdminArea-Route-id = module.AdminArea.AdminArea-Route-id
}

module "Prod" {
  count = terraform.workspace == "Prod" ? 1 : 0
  source = "./modules/Prod"
  AdminArea-Subnet = module.AdminArea.AdminArea-Subnet
  AdminArea-VPC-ID = module.AdminArea.AdminArea-VPC-ID
  AdminArea-VPC-CIDR = module.AdminArea.AdminArea-VPC-CIDR
  AdminArea-Route-id = module.AdminArea.AdminArea-Route-id
  IPSSIIPv4 = var.IPSSIIPv4
}

module "AdminArea" {
  source = "./modules/AdminArea"
  Workspace = terraform.workspace

} 

