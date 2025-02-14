# Define the VPC for EKS and ECS deployment
resource "aws_vpc" "my_eks_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-eks-vpc"
  }
}

# Define the public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_eks_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

# Define the private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_eks_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false # Typically private subnets should not map public IPs
  tags = {
    Name = "private-subnet"
  }
}

# Define the ECS Security Group
resource "aws_security_group" "ecs_security_group" {
  vpc_id = aws_vpc.my_eks_vpc.id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  tags = {
    Name = "ecs-security-group"
  }
}

# Optional: Create a NAT Gateway for private subnet internet access
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "nat-gateway"
  }
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my_eks_vpc.id
}

# Elastic IP for the NAT Gateway (for outbound internet access)
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# Optional: Route Table for private subnet to use NAT Gateway
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "private-route-table"
  }
}

# Associate route table with private subnet
resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

# Optional: VPC Endpoint for ECR to enable communication with ECR from within the VPC
resource "aws_vpc_endpoint" "ecr_endpoint" {
  vpc_id            = aws_vpc.my_eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
  subnet_ids        = [aws_subnet.private_subnet.id]

  security_group_ids = [aws_security_group.ecs_security_group.id]

  tags = {
    Name = "ecr-vpc-endpoint"
  }
}
