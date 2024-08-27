variable "s3_bucket_name" {
  description = "Provide bucket name to store the state files"
  type = string
}

variable "aws_region" {
  description = "AWS region location"
  type = string
}

variable "vpc_cidr_block" {
  description = "VPC CIDR location"
  type = string
}

variable "vpc_name" {
  description = "VPC name need to be given"
  type = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instance."
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the instance."
  type        = string
}

variable "instance_name" {
  description = "The name tag for the EC2 instance."
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the EC2 instance in."
  type        = string
}

variable "subnet_cidrs" {
    description = "Subnet CIDR address space"
    type = string
}

variable "availability_zones" {
    description = "Availalbity Zone - AZ"
    type = string
}

variable "subnet_name" {
  description = "Name for the subnet"
  type = string
}

variable "security_name" {
   description = "Security name for the group"
   type = string
}

variable "ingress_from_port" {
    description = "Ingress port from the instance"
    type = number
}

variable "ingress_to_port" {
    description = "Ingess port to the instance"
    type = number
}

variable "ingress_protocol" {
    description = "Specify the protocol for the ingess"
    type = string
}

variable "ingress_cidr_blocks" {
    description = "Notation of CIDR block for the ingress"
    type = list(string)
}

variable "user_data" {
   description = "The user data script to run on instance launch."
   type        = string
}

variable "egress_cidr_blocks" {
  description = "Egress CIDR blocks specified"
  type = list(string)
}

variable "egress_protocol" {
  description = "Egress protocol"
  type = string
}

variable "egress_to_port" {
  description = "Egress port"
  type = number
}

variable "egress_from_port" {
    description = "Egress port from the instance"
    type = number
}

variable "description" {
   description = "Description of the security groups"
   type = string
}

variable "elb_name" {
  description = "Provide a name for ELB"
  type = string
}

variable "subnet_ids" {
  description = "Given subnet ID"
  type = list(string)
}

variable "ebs_volume_sizes" {
  description = "Size of the EBS volume is given"
  type = list(string)
}