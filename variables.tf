#AWS region
variable "region" {
  type        = string
   description = "Region"
 
}
#End AWS region


#Public subnet standard starting name
variable "public_subnet_standard_name" {
  type        = string
  description = "Standard public subnet name"
}
# End Public subnet standard starting name


#Private subnet standard starting name
variable "private_subnet_standard_name" {
  type        = string
  description = "Standard private subnet name"
}
# End Private subnet standard starting name


#Internet gateway standard starting name
variable "internet_gateway_standard_name" {
  type        = string
  description = "Standard internet gateway name"
}
# End Internet gateway standard starting name

#AWS NAT gateway standard starting name
variable "nat_gateway_standard_name" {
  type        = string
  description = "Standard NAT gateway name"
}
# End AWS NAT gateway standard starting name

#Private route table standard starting name
variable "private_route_table_standard_name" {
  type        = string
  description = "Private route routing tables name"
}
# End Private route table standard starting name

#Public route table standard starting name
variable "public_route_table_standard_name" {
  type        = string
  description = "Public route routing tables name"
}
# End Public route table standard starting name














#AWS profile
variable "profile" {
  type        = string
   description = "What AWS profile to use"
  
}
#End AWS profile


#Module version
variable "terraform_module_version" {
  type        = string
   description = "Terraform module used to deploy resource"
}
#End AWS region

#VPC name
variable "vpc_name" {
  type        = string
  description = "VPC name"
  }
#End VPC bucket name

#Public subnets
variable "public_subnets" {
  description = "Public subnets"
  type        = map(object({
    cidr_block          = string
    availability_zone   = string
    map_public_ip_on_launch = bool
    route_table_name    = string
  }))
}
#End Public subnets

#Private subnets
variable "private_subnets" {
  description = "Private subnets"
  type        = map(object({
    cidr_block          = string
    availability_zone   = string
    map_public_ip_on_launch = bool
    route_table_name    = string
  }))
}
#End Private subnets

#VPC Ciddr
variable "vpc_ciddr" {
   type = string
   description = "VPC CIDDR block"
    
}
#End
