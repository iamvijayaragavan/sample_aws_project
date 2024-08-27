resource "aws_instance" "test" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data
  tags          = var.tags

  security_groups = var.security_groups

  root_block_device {
    volume_size = var.ebs_size
    volume_type = var.ebs_type
  }
}

resource "aws_volume_attachment" "attachment" {
  device_name = "/dev/xvdf"
  volume_id   = var.ebs_volume_id
  instance_id = aws_instance.this.id
}