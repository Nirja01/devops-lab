# 8. AWS Elastic Container Registry (ECR)
resource "aws_ecr_repository" "app_repo" {
  name                 = "my-devops-app-v2"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "devops-lab-ecr"
  }
}

# Output the ECR Repository URL so we can use it in GitHub Actions
output "ecr_repository_url" {
  value       = aws_ecr_repository.app_repo.repository_url
  description = "The URL of the ECR repository"
}
