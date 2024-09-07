variable "vpc_cidr_block" {
  description = "VPC CIDR location block"
  type = string
}

variable "subnet_cidrs" {
  description = "subnet CIDR location block"
  type = string
}

variable "availability_zones" {
 description = "List of availablity zone" 
 type = string
}

variable "aws_region" {
  description = "AWS region"
  type = string
}

variable "description" {
  description = "This is SG short description"
  type = string
}

variable "security_name" {
    description = "The Sercurity group name"
    type = string  
}

variable "ingress_from_port" {
  description = "Ingress inboud port"
  type = number
}

variable "ingress_to_port" {
    description = "Ingress outboound port"
    type = number 
}

variable "ingress_protocol" {
   description = "Ingress Protocol type"
   type = string
} 

variable "ingress_cidr_blocks" {
    description = "Ingress block CIDR notation details"
    type = list(string)
}

variable "egress_from_port" {
    description = "Egress inbout port"
    type = number
}

variable "egress_to_port" {
  description = "Egress outbound port"
  type = number
}  

variable "egress_protocol" {
    description = "Egress protocol type"
    type = string
}

variable "egress_cidr_blocks" {
    description = "Egress CIDR block details"
    type = list(string)
}

variable "ebs_volume_sizes" {
    description = "EBS volume size in GB"
    type = number
}

variable "ebs_volume_name" {
    description = "Name of the EBS volume"
    type = string
}

variable "volume_type" {
   description = "Type of the Volume"
   type = string
}

variable "ami_id" {
    description = "AMI ID of the Ec2 Instance"
    type = string
}

variable "instance_type" {
    description = "EC2 Instance type"
    type = string
}

variable "key_name" {
  description = "EC2 instance login key"
  type = string
}

variable "elb_name" {
  description = "Name of the Elastic load balancer"
  type = string
}