aws_region = "eu-west-1"
s3_bucket_name = "poc-state-bucket"

vpc_name = "testvpc"

vpc_cidr_block = "10.0.0.0/24"

subnet_name = nginx-subnet

subnet_cidrs = [
  "10.0.1.0/27",
  "10.0.2.0/27"
]

availability_zones = [
  "eu-west-1a",
  "eu-west-1b"
]


ingress_from_port = 80
ingress_to_port = 80
ingress_protocol = TCP
ingress_cidr_blocks = ["0.0.0.0/0"]

egress_from_port = 80
egress_to_port = 80
egress_protocol = TCP
egress_cidr_blocks = ["0.0.0.0/0"]

ami_id        = "ami-0c55b159cbfafe1f0" 
instance_type = "t2.micro"
key_name      = "my-key-pair"

description = "Port 80 is allowed"

#vpc_id = module.vpc.vpc_id

ebs_volume_sizes = [10, 50]  

user_data = "scripts/user_data.sh"  

elb_name = aws-poc-elb
subnet_ids =  [ module.subnet.subnet_ids ]