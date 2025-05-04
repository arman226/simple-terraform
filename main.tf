provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# VPC
resource "aws_vpc" "my_test_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Subnet
resource "aws_subnet" "my_test_subnet" {
  vpc_id                  = aws_vpc.my_test_vpc.id #associate subnet with VPC
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true # Enable public IP assignment

  tags = {
    Name = var.subnet_name
  }
}

# Creates a route to the internet
resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.my_test_vpc.id #associate igw with VPC
  tags = {
    Name = var.igw_name
  }
}


# Creates new reoute table with IGW
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_test_vpc.id #associate route table with VPC

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id #associate route table with igw
  }
  tags = {
    Name = var.igw_name
  }

}
# Associate the route table with the subnet
resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.my_test_subnet.id      #associate route table with subnet
  route_table_id = aws_route_table.my_route_table.id #associate route table with igw
}

# Create a security group open to all traffic
resource "aws_security_group" "my_test_sg" {
  name   = "HTTP"
  vpc_id = aws_vpc.my_test_vpc.id #associate security group with VPC

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creats EC2 instance
resource "aws_instance" "my_test_ec2" {
  ami                    = var.ec2_ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.my_test_subnet.id       #associate ec2 instance with subnet
  vpc_security_group_ids = [aws_security_group.my_test_sg.id] #associate ec2 instance with security group


  user_data = <<-EOF
              #!/bin/bash -ex
              amazon-linux-extras install -y nginx1
              echo "<h1>Hello, World!</h1>" > /var/www/html/index.html
              systemctl enable nginx
              systemctl start nginx
            EOF
  tags = {
    Name = var.ec2_name
  }
}
