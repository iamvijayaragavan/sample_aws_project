output "security_group_id" {
  description = "The IDs of the subnets"
  value       = module.security_group.security_group_id
}

output "subnet_id" {
  description = "Subnets ID given"
  value = module.subnet.subnet_id
}

output "internet_gateway_id" {
  description = "Internet gateway ID details"
  value = module.internet_gateway.ig_id
}