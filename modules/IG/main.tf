variable "vpc_id" {
  description = "ID of the VPN which need to created for IG"
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}


resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
  tags = var.tags
}

output "ig_id" {
    description = "Value of the Internet Gateway"
    value = aws_internet_gateway.main.id
}
