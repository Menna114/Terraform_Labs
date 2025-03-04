output vpc_cider {
  value = aws_vpc.main.id
}

output subnets {
  value       = aws_subnet.subnets

}

output ssh_sg_id {
  value       = aws_security_group.secruity-group-1.id

}
output app_sg_id {
  value       = aws_security_group.secruity-group-2.id
}

