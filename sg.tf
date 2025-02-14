# sg.tf

resource "aws_security_group" "eks_security_group" {
  name        = "eks-security-group"
  description = "Security group for EKS cluster"
  vpc_id      = aws_vpc.my_eks_vpc.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
