output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.my_test_ec2.id
}


output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_test_ec2.public_ip

}
