# Internet VPC
resource "aws_vpc" "main" {
    cidr_block = "${var.vpc_cidr}"
    instance_tenancy = "${var.tenancy}"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
        Name = "main"
    }
}
# Subnets
resource "aws_subnet" "main-public-1" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.main-public-1_cidr}"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2a"
#	availability_zone = "${element(var.availability_zones, count.index)}"

    tags = {
        Name = "main-public-1"
    }
}
resource "aws_subnet" "main-public-2" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.main-public-2_cidr}"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2b"
#    availability_zone = "${element(var.availability_zones, count.index)}"

    tags = {
        Name = "main-public-2"
    }
}
resource "aws_subnet" "main-public-3" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.main-public-3_cidr}"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2c"
#	availability_zone = "${element(var.availability_zones, count.index)}"

    tags = {
        Name = "main-public-3"
    }
}
resource "aws_subnet" "main-private-1" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.main-private-1_cidr}"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2a"
#	availability_zone = "${element(var.availability_zones, count.index)}"

    tags = {
        Name = "main-private-1"
    }
}
resource "aws_subnet" "main-private-2" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.main-private-2_cidr}"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2b"
#    availability_zone = "${element(var.availability_zones, count.index)}"
    tags = {
        Name = "main-private-2"
    }
}
resource "aws_subnet" "main-private-3" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.main-private-3_cidr}"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2c"
#    availability_zone = "${element(var.availability_zones, count.index)}"
    tags = {
        Name = "main-private-3"
    }
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
    vpc_id = "${var.vpc_id}"

    tags = {
        Name = "main"
    }
}

# route tables
resource "aws_route_table" "main-public" {
    vpc_id = "${var.vpc_id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.main-gw.id}"
    }

    tags = {
        Name = "main-public-1"
    }
}

# route associations public
resource "aws_route_table_association" "main-public-1-a" {
    subnet_id = "${aws_subnet.main-public-1.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
resource "aws_route_table_association" "main-public-2-a" {
    subnet_id = "${aws_subnet.main-public-2.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
resource "aws_route_table_association" "main-public-3-a" {
    subnet_id = "${aws_subnet.main-public-3.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${aws_vpc.main.id}"
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = "${aws_subnet.main-public-1.id}"
}

#output "private_subnets" {
#  description = "List of IDs of private subnets"
#  value       = ["${module.main-vpc.private_subnets}"]
#}

#output "public_subnets" {
#  description = "List of IDs of public subnets"
#  value       = ["${module.main-vpc.public_subnets}"]
#}


