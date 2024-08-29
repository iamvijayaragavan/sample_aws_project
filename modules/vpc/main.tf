variable "vpc_cidr" {
    description = "CIDR address space for VPC "
    type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = var.tags
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_arn" {
  value = aws_vpc.main.arn
}