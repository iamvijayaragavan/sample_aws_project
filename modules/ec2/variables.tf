variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of the instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key name used to login the Ec2 instance"
  type = string
}

variable "user_data" {
  description = "Startup script for the Ec2 instance"
  type = string
}

variable "security_group_id" {
  description = "The security groups for the EC2 instance."
  type        = list(string)
  default     = []
}


variable "tags" {
  type = map(string)
  default = {}
}

variable "ebs_volume_id" {
  description = "The ID of the EBS volume to attach to the EC2 instance."
  type        = string
}

variable "ebs_size" {
  description = "The size of the root EBS volume in GiB."
  type        = number
}

variable "ebs_type" {
  description = "The type of the root EBS volume."
  type        = string
}

variable "subnet_id" {
 description = "Subnet ID to attached into instance" 
}
