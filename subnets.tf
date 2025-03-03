resource "aws_subnet" "private_sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "private_sub"
  }
}
resource "aws_subnet" "public_sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "public_sub"
  }
}