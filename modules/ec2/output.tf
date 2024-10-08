output "instance_id" {
  value = aws_instance.this.id
}

output "instance_public_ip" {
  description = "The public IP of the EC2 instance."
  value       = aws_instance.this.public_ip
}

output "instance_private_ip" {
  description = "The private IP of the EC2 instance."
  value       = aws_instance.this.private_ip
}