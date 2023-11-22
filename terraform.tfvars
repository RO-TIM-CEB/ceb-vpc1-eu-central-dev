# eu-c1-3subnets.tfvars
# Customized variables for your VPC module

region                   = "eu-central-1"
profile                  = "ceb-dev"
terraform_module_version = "v0.1.0"
vpc_name                 = "ceb-central-development"

# Networking variables
vpc_ciddr = "192.168.0.0/16"

# Public subnets
public_subnets = {
  subnet1 = {
    cidr_block              = "192.168.1.0/24"
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = true
    route_table_name        = "public_route_table_subnet1"
  },
  subnet2 = {
    cidr_block              = "192.168.2.0/24"
    availability_zone       = "eu-central-1b"
    map_public_ip_on_launch = true
    route_table_name        = "public_route_table_subnet2"
  },
  subnet3 = {
    cidr_block              = "192.168.3.0/24"
    availability_zone       = "eu-central-1c"
    map_public_ip_on_launch = true
    route_table_name        = "public_route_table_subnet3"
  }
}

# Private subnets
private_subnets = {
  subnet1 = {
    cidr_block              = "192.168.11.0/24"
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = false
    route_table_name        = "private_route_table_subnet1"
  },
  subnet2 = {
    cidr_block              = "192.168.12.0/24"
    availability_zone       = "eu-central-1b"
    map_public_ip_on_launch = false
    route_table_name        = "private_route_table_subnet2"
  },
   subnet3 = {
    cidr_block              = "192.168.13.0/24"
    availability_zone       = "eu-central-1c"
    map_public_ip_on_launch = false
    route_table_name        = "private_route_table_subnet3"
  }
}

# Business TAGS, Technical TAGS, Security TAGS, and Billing TAGS can be defined here.





