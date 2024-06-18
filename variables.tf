#AWS region
variable "region" {
  type        = string
   description = "Region"

}
#End AWS region

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
