resource "aws_security_group" "secruity-group-2" {
    name = "allow ssh for vpc"
    vpc_id =aws_vpc.main.id

    tags ={
        Name="allowing-ssh"
        ENV= var.env
    }
}

resource "aws_security_group_rule" "allow-public-ssh-2" {
  type              = "ingress"
  from_port         = var.app_port
  to_port           = var.app_port
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.secruity-group-2.id
}
resource "aws_security_group_rule" "allow-public-ssh-vpc" {
  type              = "ingress"
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.secruity-group-2.id
}