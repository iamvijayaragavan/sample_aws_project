variable "elb_name" {
  description = "Name of ELB"
}

variable "availability_zones" {
  description = "ELB availablity Zone"
}

variable "subnets" {
  description = "Subnet in which ELB need to be created"
}

variable "tags" {
  type = map(string)
  default = {}
}