output "subnet_ids" {
  value = aws_subnet.multiple[*].id
}

output "subnet_id" {
  value = aws_subnet.single.id
  description = "ID of the single subnet"
}

output "subnet_arn" {
    value = aws_subnet.single.arn
}