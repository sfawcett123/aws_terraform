output "instance" {
    value = aws_instance.instance
}

output "role_name" {
   value = aws_iam_role.ec2_role.name
}