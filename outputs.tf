# Export variables
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnets"
  value       = module.vpc.private_subnet_ids
}

output "nat_gateway_id" {
  description = "NAT gateway ID"
  value       = module.vpc.nat_gateway_id
}

output "vpc_ciddr_block" {
  value = module.vpc.vpc_cidr_block
}

