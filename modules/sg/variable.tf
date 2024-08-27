variable "name" {
  description = "Name of the security group."
  type        = string
}

variable "description" {
  description = "Description of the security group."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to associate the security group with."
  type        = string
}

variable "ingress_from_port" {
  description = "The start port for ingress rules."
  type        = number
}

variable "ingress_to_port" {
  description = "The end port for ingress rules."
  type        = number
}

variable "ingress_protocol" {
  description = "The protocol for ingress rules."
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "The CIDR blocks for ingress rules."
  type        = list(string)
}

variable "egress_from_port" {
  description = "The start port for egress rules."
  type        = number
}

variable "egress_to_port" {
  description = "The end port for egress rules."
  type        = number
}

variable "egress_protocol" {
  description = "The protocol for egress rules."
  type        = string
}

variable "egress_cidr_blocks" {
  description = "The CIDR blocks for egress rules."
  type        = list(string)
}
