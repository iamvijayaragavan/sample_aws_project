variable "vpc_id" {
  description = "ID of the VPN which need to created for IG"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type = string
}

variable "gateway_id" {
    description = "Gateway address ID"
    type = string
}

variable "tags" {
  type = map(string)
  default = {}
}


resource "aws_route_table" "main" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }
  tags = var.tags
}


resource "aws_route_table_association" "main" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.main.id
}
