output "bucket_name" {
  description = "Name of the S3 bucket name"
  value = module.s3_bucket.bucket_name
}

output "elb_dns_name" {
  description = "The DNS name of the ELB."
  value       = module.elb.elb_dns_name
}

output "instance_ids" {
  description = "The IDs of the EC2 instances."
  value       = module.ec2_instance.*.instance_id
}

output "ebs_volume_ids" {
  description = "The IDs of the EBS volumes."
  value       = module.ebs_volume.volume_ids
}

output "subnet_ids" {
  description = "The IDs of the subnets."
  value       = module.subnet.subnet_ids
}
