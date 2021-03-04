provider "aws" {
    access_key = "<YOUR_AWS_ACCESS_KEY>"
    secret_key = "<YOUR_AWS_SECRET_KEY>"
    region = "us-east-2"
  
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = "10.0.0.0/16"
}

module "gateway" {
    source = "./modules/gateway"
    vpc_id = "${module.vpc.vpc_id}"
  
}

module "route-table" {
    source = "./modules/route-table"
    vpc_id = "${module.vpc.vpc_id}"
    cidr_block = "0.0.0.0/0"
    gateway_id = "${module.gateway.gateway_id}"
  
}

module "subnet" {
    source = "./modules/subnet"
     vpc_id = "${module.vpc.vpc_id}"
     cidr_block = "10.0.1.0/24"
     availability_zone = "us-east-2a"

}

module "associate-route-table" {
    source = "./modules/assocaite-route"
    subnet_id = "${module.subnet.subnet_id}"
    route_table_id = "${module.route-table.route_table_id}"
  
}

module "security-group" {
    source = "./modules/security-group"
    name = "allow web traffic"
    description = "allow tls inbound traffic"
     vpc_id = "${module.vpc.vpc_id}"
  
}

module "network-interface" {
    source = "./modules/network-interface"
    subnet_id = "${module.subnet.subnet_id}"
    private_ip = "10.0.1.50"
    security_group = "${module.security-group.security_group_id}"
}

module "eip" {
     source = "./modules/elastic-ip"
    network_interface_id = "${module.network-interface.nic_id}"
    private_ip = "10.0.1.50"
    gateway = "${module.gateway.gateway}"
  
  
}

module "ec2" {
     source = "./modules/ec2"
    ami_id = "ami-08962a4068733a2b6"
    instance_type = "t2.micro"
    availability_zone = "us-east-2a"
    key_name = "aws-keypair"
    interface_id = "${module.network-interface.nic_id}"
  
}
