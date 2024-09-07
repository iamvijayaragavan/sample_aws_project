provider "aws" {
  region = var.aws_region
}


# Creating VPC
module "vpc" {
  source      = "../modules/vpc"
  vpc_cidr  = var.vpc_cidr_block
}

# Creating Subnet
module "subnet" {
  source             = "../modules/subnet"
  vpc_id             = module.vpc.vpc_id
  cidr_block         = var.subnet_cidrs
  availability_zone  = var.availability_zones
  depends_on         = [module.vpc]
}

# Creating Security Group
module "security_group" {
  source = "../modules/sg"
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

  depends_on = [module.vpc]
}

module "internet_gateway" {
  source = "../modules/IG"
  vpc_id = module.vpc.vpc_id
  depends_on = [ module.security_group ]
}

module "route_assosication" {
    source = "../modules/IG-assosication"
    vpc_id = module.vpc.vpc_id
    subnet_id = module.subnet.subnet_id
    gateway_id = module.internet_gateway.ig_id
    depends_on = [ module.internet_gateway ]
}

module "ebs_volume_1" {
  source             = "../modules/ebs"
  size               = var.ebs_volume_sizes
  availability_zone  = var.availability_zones
  name               = var.ebs_volume_name
  type               = var.volume_type
  depends_on         = [module.security_group]
}

module "ebs_volume_2" {
  source             = "../modules/ebs"
  size               = var.ebs_volume_sizes
  availability_zone  = var.availability_zones
  name               = var.ebs_volume_name
  type               = var.volume_type
  depends_on         = [module.security_group]

}

module "ec2_instance-1" {
  source             = "../modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  ebs_volume_id      = module.ebs_volume_1.ebs_volume_id
  ebs_size           = var.ebs_volume_sizes
  ebs_type           = var.volume_type
  security_group_id  = [ module.security_group.security_group_id ]
  subnet_id          = module.subnet.subnet_id
  user_data          = file("../scripts/user_data.sh")

  depends_on = [module.ebs_volume_1]
}

module "ec2_instance-2" {
  source             = "../modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  ebs_volume_id      = module.ebs_volume_2.ebs_volume_id
  ebs_size           = var.ebs_volume_sizes
  ebs_type           = var.volume_type
  security_group_id  = [ module.security_group.security_group_id ]
  subnet_id          = module.subnet.subnet_id
  user_data          = file("../scripts/user_data.sh")

  depends_on = [module.ebs_volume_2]
}

module "elb" {
  source             = "../modules/elb"
  elb_name           = var.elb_name
  subnet_ids         = module.subnet.subnet_id
  availability_zones = [ var.availability_zones ]
  instance_ids       = [ module.ec2_instance-1.instance_id, module.ec2_instance-2.instance_id ]
}