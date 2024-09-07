variable "vpc_cidr" {
    description = "CIDR address space for VPC "
    type = string
}

variable "dns_support" {
  description = "Enabling DNS support"
  type = bool
  default = true
}

variable "dns_hostname" {
  description = "Enabling the hostname"
  type = bool
  default = true
}
variable "tags" {
  type = map(string)
  default = {}
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = var.dns_support
  enable_dns_hostnames = var.dns_hostname
  tags = var.tags
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_arn" {
  value = aws_vpc.main.arn
}