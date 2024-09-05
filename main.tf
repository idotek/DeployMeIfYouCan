module "Lab" {
  count = terraform.workspace == "Lab" ? 1 : 0
  source = "./modules/Lab"
}

module "Prod" {
  count = terraform.workspace == "Prod" ? 1 : 0
  source = "./modules/Prod"
}

module "AdminArea" {
  source = "./modules/AdminArea"
}

