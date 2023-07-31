 resource "aws_route_table" "main-rtb-tf" {
    
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.igw_id
    }
    tags = {
          Name: "${var.env_prefix}-main-rtb"
      }
}