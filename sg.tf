# sg.tf

resource "aws_security_group" "eks_security_group" {
  name        = "eks-security-group"
  description = "Security group for EKS cluster"
  vpc_id      = aws_vpc.my-vpc.id
}

resource "aws_security_group_rule" "allow_eks_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks_security_group.id
}
