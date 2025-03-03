resource "aws_elasticache_subnet_group" "my_elastic_cache_subnet_group" {
  name       = "ec-private-sg"
  subnet_ids = [aws_subnet.subnets["private1"].id, aws_subnet.subnets["private2"].id] 

  tags = {
    Name = "ec-private-subnet-group"
  }
}

resource "aws_elasticache_cluster" "example" {
  cluster_id           = "redis-cache"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1  
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.my_elastic_cache_subnet_group.name
}
