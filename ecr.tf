resource "aws_ecr_repository" "hello-kubernetes-repo" {
  name                 = var.ecr_repository_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  lifecycle {
    prevent_destroy = false
  }
}
