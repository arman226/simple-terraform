##### VPC #####
vpc_cidr = "10.0.0.0/16"
vpc_name = "MyTerraformVPC"

##### PUBLIC SUBNET #####
subnet_cidr = "10.0.1.0/24"
subnet_name = "MyTestSubnet"

##### INTERNET GATEWAY #####
igw_name = "MyTestIGW"

##### EC2 INSTANCE #####
ec2_ami = "ami-01f5a0b78d6089704" # Amazon Linux 2 AMI
ec2_name = "MyTestEC2Instance"