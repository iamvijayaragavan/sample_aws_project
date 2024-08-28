variable "availability_zone" {
  description = "The availability zone to create the volume in."
  type        = string
}

variable "size" {
  description = "The size of the EBS volume in GiB."
  type        = number
}

variable "type" {
  description = "The type of the EBS volume."
  type        = string
}

variable "name" {
  description = "The name tag for the EBS volume."
  type        = string
}
