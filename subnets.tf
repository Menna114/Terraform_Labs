resource "aws_subnet" "private_sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "private_sub"
  }
}
resource "aws_subnet" "public_sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_sub"
  }
}