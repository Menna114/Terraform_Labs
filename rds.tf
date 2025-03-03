resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.my_rds_subnet_group.name
  availability_zone    = "us-east-1a"
}
resource "aws_db_subnet_group" "my_rds_subnet_group" {
  name       = "rds-private-sg"
  subnet_ids = [aws_subnet.subnets["private1"].id, aws_subnet.subnets["private2"].id]

  tags = {
    Name = "rds-private-subnet-group"
  }
}