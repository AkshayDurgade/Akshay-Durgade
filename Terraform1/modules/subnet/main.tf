resource "aws_subnet" "public_subnets" {
    count = length(var.availability_zones)

    vpc_id = var.vpc_id
    cidr_block = var.public_subnet_cidrs[count.index]
    availability_zone = var.availability_zones[count.index]
    map_public_ip_on_launch = true
    tags = {
        Name : "${var.env_prefix}-subnet-${count.index + 1}-public"
    }
}

resource "aws_subnet" "private_subnets" {
    count = length(var.availability_zones)

    vpc_id = var.vpc_id
    cidr_block = var.private_subnet_cidrs[count.index]
    availability_zone = var.availability_zones[count.index]
    tags = {
        Name : "${var.env_prefix}-subnet-${count.index + 1}-private"
    }
}
