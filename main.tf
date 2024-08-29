provider "aws" {
  region = var.aws_region
}

# module "s3_bucket" {
#   source      = "./modules/s3"
#   bucket_name = var.s3_bucket_name
# }

# Creating VPC
module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr  = var.vpc_cidr_block
}

# Creating Subnet
module "subnet" {
  count              = 2
  source             = "./modules/subnet"
  vpc_id             = module.vpc.vpc_id
  cidr_block         = var.subnet_cidrs
  availability_zone  = var.availability_zones
}

# Creating Security Group
module "security_group" {
  source = "./modules/sg"
  vpc_id      = module.vpc.vpc_id
  description = var.description

  
  name        = var.security_name
  ingress_from_port = var.ingress_from_port
  ingress_to_port = var.ingress_to_port
  ingress_protocol = var.ingress_protocol
  ingress_cidr_blocks= var.ingress_cidr_blocks
  
  egress_from_port = var.egress_from_port
  egress_to_port = var.egress_to_port
  egress_protocol = var.egress_protocol
  egress_cidr_blocks = var.egress_cidr_blocks

}

# Creating EBS Volumes
module "ebs_volume" {
  source             = "./modules/ebs"
  size               = var.ebs_volume_sizes
  availability_zone  = var.availability_zones
  name               = var.ebs_volume_name
  type               = var.volume_type
}

# Creating Ec2 instance
module "ec2_instance" {
  source             = "./modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  ebs_volume_id      = module.ebs_volume.ebs_volume_id
  ebs_size           = var.ebs_volume_sizes
  ebs_type           = var.volume_type
  security_group_id  = module.security_group.security_group_id
  subnet_id          = module.subnet.subnet_id
  user_data          = file("scripts/user_data.sh")
}

# Creating ELB
module "elb" {
  source             = "./modules/elb"
  elb_name           = var.elb_name
  subnet_ids         = [ module.subnet.subnet_id ]
  availability_zones = var.availability_zones
  instance_ids       = module.ec2_instance.*.instance_id
}

