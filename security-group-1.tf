resource "aws_security_group" "secruity-group-1" {
    name = "allow ssh"
    vpc_id =aws_vpc.main.id

    tags ={
        Name="allowing-ssh"
    }
}
resource "aws_security_group_rule" "allow-public-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.secruity-group-1.id
}