resource "aws_ssm_parameter" "ssm_parameter" {
  name  = "devops-ssm-parameter"
  type  = "String"
  value = "devops-value"
}
