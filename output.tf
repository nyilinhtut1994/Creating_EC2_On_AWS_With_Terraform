output "ec2" {
    value = resource.aws_instance.ec2_instance[*].public_ip
}