output "tf_key_pair" {
  value = aws_key_pair.tf-key-pair.key_name
}

output "security_group" {
  value = aws_security_group.EC2SecurityGroup.id
}

output "Instance_id" {
  value = aws_instance.EC2Instance.id
}

output "vm_host_ip" {
  value = aws_instance.EC2Instance.public_ip
}

output "vm_username" {
  value = var.vm_username
}

output "aws_region" {
  value = var.awsRegion
}