output "elb_dns_name" {
  value = aws_elb.this.dns_name
}

output "elb_arn" {
  value = aws_elb.this.arn
}

output "elb_id" {
  value = aws_elb.this.id
}