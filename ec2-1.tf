resource "aws_instance" "ec2s" {
  count = 2
  ami           = var.list_of_ec2s[count.index].ami
  instance_type = var.list_of_ec2s[count.index].ec2_tier
  #subnet_id = aws_subnet.subnets["public1"].id
  subnet_id     = var.list_of_ec2s[count.index].name == "bastion" ? module.network.subnets["public1"].id: module.network.subnets["private1"].id

  associate_public_ip_address = var.list_of_ec2s[count.index].name == "bastion" ? true : false
  
  tags = {
    Name = var.list_of_ec2s[count.index].name
  }
  
  #vpc_security_group_ids =[aws_security_group.secruity-group-1.id]
  vpc_security_group_ids =[var.list_of_ec2s[count.index].name =="bastion"? module.network.ssh_sg_id: module.network.app_sg_id]
  
  provisioner "local-exec"{
    command = var.list_of_ec2s[count.index].name == "bastion" ? "echo The public IP of Bastion is: ${self.public_ip}" : "echo This instance is private and has no public IP"
  }
}



