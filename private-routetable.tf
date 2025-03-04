resource "aws_route_table" "private-route" {
    vpc_id = module.network.vpc_cider

    tags ={
        Name = "private-route-table"
    }
}