resource "aws_subnet" "subnets" {
  for_each ={for subnet in var.subnets_list : subnet.name=> subnet} #use the subnet name as my reference
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.cidr
  tags =  {"Name"= each.value.name}
  availability_zone       = each.value.zone
  map_public_ip_on_launch = each.value.type =="public"? true:false
}