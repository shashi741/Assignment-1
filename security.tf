# Create Security Group
resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  vpc_id      = aws_vpc.my_vpc.id
  description = "Dev VPC Web"

  # Inbound rule for SSH
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule for all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

  