resource "aws_instance" "application" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.private_sub.id

  tags = {
    Name = "terrafrom-application"
  }
  vpc_security_group_ids =[aws_security_group.secruity-group-2.id]
}
