variable "VPC" {
  type = object({
    Name = string
    Subnet = string
  })
  default = {
    Name = "ADMIN_AREA_VPC_SUBNET_PROJECT_NAME"
    Subnet = "10.PROJECT_ID.1.0/24"
  }

}

variable "Subnet" {
  type = object({
    Name = string
    cidr_block = string
    region                  = string
    map_public_ip_on_launch = bool
  })
  default = {
    Name = "ADMIN_AREA_SUBNET_PROJECT_NAME"
    cidr_block = "10.PROJECT_ID.1.32/28"
    region = "us-east-1a"
    map_public_ip_on_launch = true
  }
}


variable "Instance" {
  type = object({
    name          = string
    instance_type = string
    ami           = string
  })
  default = {
    name = "ADMIN_AREA_BASTION_PROJECT_NAME"
    instance_type = "t2.micro"
    ami           = "ami-0e86e20dae9224db8"
  }
}


variable "Gateway_Name" {
  default = "ADMIN_AREA_GATEWAY_PROJECT_NAME"
}

variable "Routing_Name" {
  default = "ADMIN_AREA_ROUTING_PROJECT_NAME"
}

variable "SecurityGroup_Name" {
  default = "ADMIN_AREA_NSG_PROJECT_NAME"
}

variable "Workspace" {}
variable "ProjectName" {
  default = "PROJECT_NAME"
}

