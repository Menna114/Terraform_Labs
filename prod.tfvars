vpc_cider="10.1.0.0/16"
public_subnet_cidr="10.1.2.0/24"
private_subnet_cidr="10.1.1.0/24"
env="prod"
ami="ami-06ee6255945a96aba"
instance_type="t2.micro"
ssh_port=22
app_port=3000
region="eu-central-1"
new_count=2
list_of_ec2s=[{
    ec2_tier ="t2.micro",
    name ="bastion",
    ami ="ami-05b10e08d247fb927"

},
{
    ec2_tier ="t2.micro",
    name ="application",
    ami ="ami-05b10e08d247fb927"

}
]
subnets_list =[{
    name="public1",
    cidr="10.0.2.0/24",
    type= "public",
    zone="us-east-1a"
},
{
    name = "private1"
    cidr = "10.0.1.0/24"
    type = "private"
    zone = "us-east-1a"
  },
  {
    name = "private2"
    cidr = "10.0.3.0/24"
    type = "private"
    zone = "us-east-1b"
  }]
