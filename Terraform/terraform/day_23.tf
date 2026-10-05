# main.tf

# Tạo CloudFormation stack chứa S3 bucket với versioning
resource "aws_cloudformation_stack" "nautilus_stack" {
  name = "nautilus-stack"

  template_body = jsonencode({
    AWSTemplateFormatVersion = "2010-09-09"
    Resources = {
      NautilusBucket = {
        Type = "AWS::S3::Bucket"
        Properties = {
          BucketName = "nautilus-bucket-644404862"
          VersioningConfiguration = {
            Status = "Enabled"
          }
        }
      }
    }
  })
}