module "network" {
    source= "./network-module"
    vpc_cider=var.vpc_cider
    env=var.env
    subnets_list=var.subnets_list
}