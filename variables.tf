variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "MyTerraformVPC"
}
variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "MyTestSubnet"
}

variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
  default     = "MyTestIGW"
}



variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-01f5a0b78d6089704" # Amazon Linux 2 AMI
}


variable "ec2_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "MyTestEC2Instance"
}
