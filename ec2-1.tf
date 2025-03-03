resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_sub.id

  associate_public_ip_address = true
  
  tags = {
    Name = "terrafrom-bastion"
  }
  vpc_security_group_ids =[aws_security_group.secruity-group-1.id]
  
  provisioner "local-exec"{
    command= "echo ${self.public_ip} > inv.txt"
  }

}

