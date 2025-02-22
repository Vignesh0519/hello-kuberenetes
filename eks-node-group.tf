# resource "aws_eks_node_group" "eks_nodes" {
#   cluster_name  = aws_eks_cluster.eks_cluster.name
#   node_role_arn = aws_iam_role.eks_worker_role.arn

#   subnet_ids = [aws_subnet.private_subnet.id]

#   scaling_config {
#     desired_size = 2
#     min_size     = 1
#     max_size     = 3
#   }

#   instance_types = ["t3.medium"]
#   disk_size      = 20

#   depends_on = [
#     aws_iam_role_policy_attachment.eks_ecr_readonly,
#     aws_iam_role_policy_attachment.eks_cni_policy
#   ]
# }
