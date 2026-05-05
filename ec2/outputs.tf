output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "instance_arn" {
  description = "The ARN of the EC2 instance"
  value       = aws_instance.this.arn
}

output "private_ip" {
  description = "The private IP address of the instance"
  value       = aws_instance.this.private_ip
}

output "public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.this.public_ip
}

output "security_groups" {
  description = "The security groups associated with the instance"
  value       = aws_instance.this.security_groups
}

output "availability_zone" {
  description = "The availability zone of the instance"
  value       = aws_instance.this.availability_zone
}
