variable cidr_block {}
# variable vpc_id {}
# variable subnet_cidr_block {}
# variable subnet_cidr_block_2_public {}
# variable subnet_cidr_block_3_private {}
# variable subnet_cidr_block_4_private {}
variable availability_zone {}
variable env_prefix {}
variable availability_zone_1 {}
variable availability_zones {
    default = [ "ap-south-1a","ap-south-1b"]
}
variable public_subnet_cidrs {}
variable private_subnet_cidrs {}