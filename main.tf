terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
    github = {
      source = "integrations/github"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "state-terraform-s3-ceb-vpc-dev"
    key    = "dev/europe/central-1/ceb-vpc1-eu-central-dev"
    region = "eu-central-1"
  }

  required_version = "~> 1.6.0"  # Specify the minimum required Terraform version here
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

module "vpc" {
  source = "git@github.com:RO-TIM-CEB/tf-aws-dev-ceb-vpc-module.git?ref=main"
  
# Important note:
# If you want to change optional values, you must know what you are doing.

#Global variables
# MANDATORY
# Default region
  terraform_module_version   = var.terraform_module_version           # Allowed regions: us-west-2, eu-west-1 and eu-central-1
# End Default region
# AWS profile
  profile                    = var.profile           # Allowed profile names: ceb-dev, ceb-staging and ceb-prod
# End AWS profile
# Region 
  region                     = var.region                  # Allowed values us-west-2, eu-west-1 ad eu-central-1 
# End Region
# End MANDATORY
# End Global variables


# Terraform VPC variable
# MANDATORY
  vpc_name            = var.vpc_name # Maximum 30 characters, no defaults, RECOMMANDATION: ceb, ceb-management
# End MANDATORY
# OPTIONAL - ONLY IF YOU KNOW WHAT ARE YOU DOING!!!
  enable_dns_support        = "true"                 # Allowed options true/false, defaults=true
  enable_dns_hostnames      = "true"               # Allowed options true/false, defaults=true
# End OPTIONAL - ONLY IF YOU KNOW WHAT ARE YOU DOING!!!
# End Terraform VPC variable


#Networking
vpc_ciddr = var.vpc_ciddr

# Requirements: All values  must be low caps
# Public subnets definitions
  public_subnets = var.public_subnets
# END Public subnets definitions


# Private subnets definitions
  private_subnets = var.private_subnets
# END Public subnets definitions
# End Networking



# MANDATORY
#### IMPORTANT:
#### Ensure all code is written in lowercase (lowcaps) as it is MANDATORY.
#### Failure to do so during execution can result in the code breaking the standard and causing the execution to fail.
#### Please adhere to this requirement to maintain consistency and avoid issues.
# Business TAGS
  business_tags = {
    "atos:business:project"                  = "ceb development - ceb on aws"
    "atos:business:owner"                    = "ceb team"
    "atos:business:charge_to_id"             = "ro.7b6801.400.01"
    "atos:business:businessunit"             = "businessunit"
    "atos:business:wbs"                      = "ro.7b6801.400.01"
    "atos:business:stakeholder"              = "atos"
    "atos:business:impact"                   = "low"
    "atos:business:dedicated:client_name"    = "ceb"
    "atos:business:dedicated:country"        = "all"
  }
  # End Business TAGS

# VPC Technical TAGS
  technical_vpc_tags = {
    "atos:vpc:technical:stack"               = "development"
    "atos:vpc:technical:deployment_method"   = "terraform"
    "atos:vpc:technical:connectivity_type"   = "public"
    "atos:vpc:technical:flow_logs"           = "disabled"
    "atos:vpc:technical:vpn_connection"      = "disabled"
    "atos:vpc:technical:peering"             = "disabled"
  }
  # End VPC Technical TAGS  


# VPC Technical Public Subnets TAGS
  technical_public_subnet_tags = {
   "atos:subnet:public:technical:stack"                  = "development"
   "atos:subnet:public:technical:deployment_method"     = "terraform"
   "atos:subnet:public:technical:connectivity_type"     = "public"
   "atos:subnet:public:technical:internet_gateway"      = "enabled"
  }
  # End VPC Technical Public Subnets TAGS   

# VPC Technical Private Subnets TAGS
  technical_private_subnet_tags = {
    "atos:subnet:private:technical:stack"                 = "development"
    "atos:subnet:private:technical:deployment_method"     = "terraform"
    "atos:subnet:private:technical:connectivity_type"     = "private"
    "atos:subnet:private:technical:nat"                   = "nat gateway"
  }
  # End VPC Technical Private Subnets TAGS   
  
  
  # VPC Technical Private Subnets TAGS
  technical_tags = {
    "atos:technical:deployment_method"                    = "terraform"
    "atos:technical:stack"                                = "development"
    
  }
  # End VPC Technical Private Subnets TAGS    


# VPC Security TAGS
  security_vpc_tags  = {
    "atos:vpc:security:compliance"             = "none"
    "atos:vpc:security:classification"         = "restricted"
    "atos:vpc:security:encryption"             = "encrypted"
    "atos:vpc:security:level"                  = "medium"
    "atos:vpc:security:incident_response"      = "adrian mendyk"
    "atos:vpc:security:access_control"         = "private access"
  }
  # End VPC Security TAGS        


# VPC Billing TAGS
  billing_tags  = {
    "atos:billing:credit"                   = "apn_12_21_2022"
    "atos:billing:account_name"             = "737580263478"
    "atos:billing:contact_name"             = "radoslaw wieckowski"
    "atos:billing:contact_email"            = "radoslaw.wieckowski@atos.net"
  }
  # End VPC Billing TAGS        
}
