module "Lab" {
  count = terraform.workspace == "Lab" ? 1 : 0
  source = "./modules/Lab" 
  AdminArea-Subnet = module.AdminArea.AdminArea-Subnet
  IPSSI-IPv4 = var.IPSSI-IPv4
  AdminArea-VPC-ID = module.AdminArea.AdminArea-VPC-ID
}

module "Prod" {
  count = terraform.workspace == "Prod" ? 1 : 0
  source = "./modules/Prod"
  AdminArea-Subnet = module.AdminArea.AdminArea-Subnet
  AdminArea-VPC-ID = module.AdminArea.AdminArea-VPC-ID


}

module "AdminArea" {
  source = "./modules/AdminArea"
  Workspace = terraform.workspace
} 

