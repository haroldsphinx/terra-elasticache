
# vpc
resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr_block}"
    enable_dns_hostnames = true

    tags = {
        Name = "${var.namespace}"
    }
}

# internet gateway 
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"

    tags = {
        Name = "${var.namespace}"
    }
}

# Grant vpc internet access oin main route table

resource "aws_route" "internet_access" {
  route_table_id = "${aws_vpc.default.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.default.id}"
}

# Grab the list of Availability Zones
data "aws_availability_zones" "available" {

}

# Create Subnet

resource "aws_subnet" "default" {
  count = "${length(var.cidr_block)}"
  vpc_id = "${aws_vpc.default.id}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block = "${var.cidr_block[count.index]}"

  tags = {
      Name = "${var.namespace}"
  }
}


