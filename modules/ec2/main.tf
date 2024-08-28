resource "aws_instance" "test" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data
  tags          = var.tags
  subnet_id     = var.subnet_id
  security_groups = var.security_group_id

  root_block_device {
    volume_size = var.ebs_size
    volume_type = var.ebs_type
  }
}

resource "aws_volume_attachment" "attachment" {
  device_name = "/dev/xvdf"
  volume_id   = var.ebs_volume_id
  instance_id = aws_instance.test.id
}