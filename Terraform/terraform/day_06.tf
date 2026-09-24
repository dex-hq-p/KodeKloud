resource "aws_eip" "devops_eip" {
  domain = "vpc"

  tags = {
    Name = "devops-eip"
  }
}