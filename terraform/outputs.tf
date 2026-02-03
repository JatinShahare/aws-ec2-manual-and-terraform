output "instance_id" {
  description = "EC2 instance ID created by Terraform"
  value       = aws_instance.ec2.id
}

output "public_ip" {
  description = "Public IP of Terraform EC2 instance"
  value       = aws_instance.ec2.public_ip
}

output "public_dns" {
  description = "Public DNS of Terraform EC2 instance"
  value       = aws_instance.ec2.public_dns
}

