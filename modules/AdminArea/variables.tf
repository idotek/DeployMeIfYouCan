variable "VPC" {
  type = object({
    Name = string
    Subnet = string
  })
  default = {
    Name = "ADMIN_AREA_VPC_SUBNET_PROJECTNAME"
    Subnet = "ADMIN_AREA_VPC_SUBNET_CIDR"
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
    Name = "ADMIN_AREA_SUBNET_PROJECTNAME"
    cidr_block = "ADMIN_AREA_SUBNET_CIDR"
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
    name = "ADMIN_AREA_BASTION_PROJECTNAME"
    instance_type = "ADMIN_AREA_INSTANCE_TYPE"
    ami = "ADMIN_AREA_INSTANCE_AMI"
  }
}


variable "Gateway_Name" {
  default = "ADMIN_AREA_GATEWAY_PROJECTNAME"
}

variable "Routing_Name" {
  default = "ADMIN_AREA_ROUTING_PROJECTNAME"
}

variable "SecurityGroup_Name" {
  default = "ADMIN_AREA_NSG_PROJECTNAME"
}