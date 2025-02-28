resource "aws_route_table" "private-route" {
    vpc_id = aws_vpc.main.id

    tags ={
        Name = "private-route-table"
    }
}