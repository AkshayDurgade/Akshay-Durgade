resource "aws_internet_gateway" "myapp-igw" {
    vpc_id = var.vpc_id
    tags = {
        Name: "${var.env_prefix}-ig-tf"
    }
}