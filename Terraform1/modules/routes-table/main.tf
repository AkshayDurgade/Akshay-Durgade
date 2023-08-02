 resource "aws_route_table" "main-public-rtb-tf" {
    
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.igw_id
    }
    tags = {
          Name: "${var.env_prefix}-main-public-rtb"
      }
}

resource "aws_route_table_association" "public-subnet-route" {
    count = length(var.subnet_id_arr_public)
    subnet_id = var.subnet_id_arr_public[count.index]
    route_table_id = aws_route_table.main-public-rtb-tf.id
}

resource "aws_route_table" "main-private-rtb-tf" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.igw_id
    }
    tags = {
        Name: "${var.env_prefix}-main-private-rtb"
    }
}

resource "aws_route_table_association" "private-subnet-route" {
    count = length(var.subnet_id_arr_private)
    subnet_id = var.subnet_id_arr_private[count.index]
    route_table_id = aws_route_table.main-private-rtb-tf.id
}