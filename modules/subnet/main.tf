resource "aws_subnet" "single" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = var.tags
}

# resource "aws_subnet" "multiple" {
#   count             = length(var.subnets)
#   vpc_id            = var.vpc_id
#   cidr_block        = var.subnets[count.index].cidr_block
#   availability_zone = var.subnets[count.index].availability_zone
#   map_public_ip_on_launch = false
#   tags = var.tags
# }
