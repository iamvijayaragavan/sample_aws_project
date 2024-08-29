variable "elb_name" {
  description = "Name of ELB"
  type = string
}

variable "availability_zones" {
  description = "ELB availablity Zone"
}

variable "subnet_ids" {
  description = "Subnet in which ELB need to be created"
  type        = list(string)
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "instance_ids" {
  description = "List of instance IDs to attach to the ELB."
  type        = list(string)
}