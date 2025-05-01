provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# Declare an EC2 Instance
resource "aws_instance" "app_server" {
  ami           = "ami-01f5a0b78d6089704" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "My Terraform Instance "
  }
}
