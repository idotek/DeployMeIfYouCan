module "Lab" {
  count = terraform.workspace == "Lab" ? 1 : 0
  source = "./modules/Lab" 
  AdminArea-Subnet = module.AdminArea.AdminArea-Subnet
}

module "Prod" {
  count = terraform.workspace == "Prod" ? 1 : 0
  source = "./modules/Prod"
  AdminArea-Subnet = module.AdminArea.AdminArea-Subnet

}

module "AdminArea" {
  source = "./modules/AdminArea"
  Workspace = terraform.workspace
} 

