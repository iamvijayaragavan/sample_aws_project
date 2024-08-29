variable vpc_id {
    description = "This is VPC ID"
    type = string
}

variable "cidr_block" {
   description = "CIDR block address of the subnet"
   type = string
}

variable "availability_zone" {
    description = "Specify the AZ"
    type = string  
}

# variable "subnets" {
#    description = "list of subnet address"
#    type = list(string)
# }


variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    cidr_block        = string
    availability_zone = string
  }))
}

# variable "subnet_name" {
#   description = "Name for the subnets"
#   type = string
# }

variable "tags" {
  type = map(string)
  default = {}
}