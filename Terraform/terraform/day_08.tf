# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-f51113b4837953b4a"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}

# Create AMI from the EC2 instance
resource "aws_ami_from_instance" "xfusion_ec2_ami" {
  name               = "xfusion-ec2-ami"
  source_instance_id = aws_instance.ec2.id
}
