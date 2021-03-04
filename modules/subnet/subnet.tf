resource "aws_subnet" "subnet-1" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.cidr_block}"
    availability_zone = "${var.availability_zone}"
    tags={
        Name = "subnet"
    } 
}

output "subnet_id" {
    value = "${aws_subnet.subnet-1.id}"
  
}