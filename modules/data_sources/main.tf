data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter = {
    name = "amzn2-ami-hvm-*-x86_64-gp2"
  }
}