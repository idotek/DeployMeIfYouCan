variable "access_key" {
  description = "Aws access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Aws secret key"
  type        = string
  sensitive   = true
}


variable "region" {
  description = "Aws region"
  type        = string
  default     = "us-east-1"
}

variable "IPSSI-IPv4" {
  type = string
  sensitive = true
}

variable "ProjectName" {
  default = "PROJECT_NAME"
}
