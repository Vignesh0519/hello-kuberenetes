# variables.tf
variable "region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

#ecr
variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "hello-kubernetes-repo"
}

variable "image_tag_mutability" {
  description = "Whether the ECR images can be overwritten (MUTABLE or IMMUTABLE)"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Enable image vulnerability scanning"
  type        = bool
  default     = true
}
