# Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  count                  = var.ec2_instance_count
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.vpc-web.id]
  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_block_device
  }
  tags = {
    "Name" = "myec2vm"
  }
}
