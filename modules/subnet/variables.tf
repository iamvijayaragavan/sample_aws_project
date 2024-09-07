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

variable "tags" {
  type = map(string)
  default = {}
}