variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "My Terraform Instance Name"

}


variable "ec2_instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
