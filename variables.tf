# variables.tf

variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}

variable "region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_a_cidr" {
  description = "CIDR block for subnet-a"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_b_cidr" {
  description = "CIDR block for subnet-b"
  type        = string
  default     = "10.0.2.0/24"
}

variable "vpc_id" {
  description = "VPC ID for the cluster"
  type        = string
}

#ecr
variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "fastapi-app"
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
