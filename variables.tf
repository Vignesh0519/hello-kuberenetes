# variables.tf

# AWS region where resources will be created
variable "region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-east-1"
}

# Name of the EKS Cluster
variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
  default     = "my-eks-cluster"
}

# CIDR block for the VPC
variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

# CIDR block for the public subnet
variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# CIDR block for the private subnet
variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# ECR variables
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

# ECS and CodeDeploy related variables

# Name of the ECS cluster
variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "my-ecs-cluster"
}

# ECS service name for deployment
variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "my-ecs-service"
}

# ECS task definition name
variable "ecs_task_definition" {
  description = "The name of the ECS task definition"
  type        = string
  default     = "my-ecs-task-definition"
}

# CodeDeploy application name
variable "codedeploy_app_name" {
  description = "The name of the CodeDeploy application"
  type        = string
  default     = "ecs-app-deployment"
}

# CodeDeploy deployment group name
variable "codedeploy_deployment_group_name" {
  description = "The name of the CodeDeploy deployment group"
  type        = string
  default     = "ecs-deployment-group"
}

# IAM Role for CodeDeploy
variable "codedeploy_role_name" {
  description = "The IAM role used by CodeDeploy"
  type        = string
  default     = "CodeDeployRole"
}

# IAM Role for ECS task execution
variable "ecs_task_execution_role_name" {
  description = "The IAM role used for ECS task execution"
  type        = string
  default     = "ecsTaskExecutionRole"
}

