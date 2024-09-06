locals {
  Subnet = {
    AZ-A-Machine  = aws_subnet.Prod-Subnet["AZ-A"].id
    AZ-B-Machine  = aws_subnet.Prod-Subnet["AZ-B"].id
    AZ-C-Machine  = aws_subnet.Prod-Subnet["AZ-C"].id
  }
}

variable "ProjectName" {
  default = "PROJECT_NAME"
}

variable "VPC" {
  type = object({
    Name = string
    Subnet = string
  })
  default = {
    Name = "PROD_VPC_PROJECT_NAME"
    Subnet = "10.PROJECT_ID.2.0/24"
  }

}

variable "Subnet" {
  type = map(object({
    name                    = string
    cidr_block              = string
    region                  = string
    map_public_ip_on_launch = bool

  }))
  default = {
    "AZ-A" = {
      name                    = "PROJECT_NAME-AZ-A"
      cidr_block              = "10.PROJECT_ID.2.32/28"
      region                  = "us-east-1a"
      map_public_ip_on_launch = true
    }
    "AZ-B" = {
      name                    = "PROJECT_NAME-AZ-B"
      cidr_block              = "10.PROJECT_ID.2.48/28"
      region                  = "us-east-1b"
      map_public_ip_on_launch = true
    }
    "AZ-C" = {
      name                    = "PROJECT_NAME-AZ-C"
      cidr_block              = "10.PROJECT_ID.2.64/28"
      region                  = "us-east-1c"
      map_public_ip_on_launch = true
    }
  }
}

variable "instances" {
  type = map(object({
    name          = string
    instance_type = string
    ami           = string
  }))
  default = {
    "AZ-A-Machine" = {
      name          = "PROJECT_NAME-AZ-A-Machine"
      instance_type = "PROJECT_INSTANCE_TYPE"
      ami           = "PROJECT_AMI"
    }
    "AZ-B-Machine" = {
      name          = "PROJECT_NAME-AZ-B-Machine"
      instance_type = "PROJECT_INSTANCE_TYPE"
      ami           = "PROJECT_AMI"
    }
    "AZ-C-Machine" = {
      name          = "PROJECT_NAME-AZ-C-Machine"
      instance_type = "PROJECT_INSTANCE_TYPE"
      ami           = "PROJECT_AMI"
    }
  }
}

variable "AdminArea-Subnet" {}
variable "AdminArea-VPC-ID" {}
variable "AdminArea-VPC-CIDR" {}
variable "AdminArea-Route-id" {}

variable "IPSSIIPv4" {}