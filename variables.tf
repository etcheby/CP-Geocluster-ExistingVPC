#########################################
############# Variables #################
#########################################

variable "geocluster_vpc" {
  description = "Check Point Geocluster VPC ID"
  default     = ""
}

variable "public_subnet1" {
  description = "Geocluster Public Subnet AZ1 ID"
  default     = ""
}

variable "public_subnet2" {
  description = "Geocluster Public Subnet AZ2 ID"
  default     = ""
}

variable "private_subnet1" {
  description = "Geocluster Private Subnet AZ1 ID"
  default     = ""

variable "private_subnet2" {
  description = "Geocluster Private Subnet AZ2 ID"
  default     = ""
}

variable "tgw_subnet1" {
  description = "Geocluster TGW Subnet AZ1 ID"
  default     = ""
}

variable "tgw_subnet2" {
  description = "Geocluster TGW Subnet AZ2 ID"
  default     = "a"
}

variable "tgwha_public_rt" {
  description = "Subnet RT associated to geocluster public subnets"
  default     = ""
}

variable "tgwha_private_rt" {
  description = "Subnet RT associated to geocluster private subnets"
  default     = ""
}

variable "geocluster_igw" {
  description = "Existing VPC IGW ID"
  default     = ""
}

variable "gateway_name" {
  description = "Name of Geocluster Instances"
  default     = ""
}

variable "gateway_iamrole" {
  description = "IAM Role Name for Geocluster Instances API Failover"
  default     = ""
}

variable "kmskey_identifier" {
  description = "KMS or CMK key Identifier - Use key ID, alias or ARN. Key alias should be prefixed with 'alias/' "
  default     = "alias/aws/ebs"
}

variable "gateway_hostname" {
  description = "Geocluster Instances Hostname"
  default     = ""
}


#######################################################
############# Check Point Settings ####################
#######################################################
# Hashed password for the Check Point servers - you can generate this with the command 'openssl passwd -1 <PASSWORD>'
# (Optional) You can instead SSH into the server and run (from clish): 'set user admin password', fowlloed by 'save config'

variable "password_hash" {
  description = "Hashed password for the Check Point servers - Optional but recommended"
  default     = ""
}

variable "sic_key" {
  description = "OTP to establish connectivity between Mgmt & Security Gateway"
  default     = ""
}

variable "cpversion" {
  description = "Check Point version"
  default     = "R80.40"
}

variable "key_name" {
  description = "Key Pair to SSH into Check Point instances"
  default     = "AWSLab"
}

variable "gateway_instance_type" {
  default = "c5.large"
}

variable "primary_az" {
  description = "primary AZ"
  default     = ""
}

variable "secondary_az" {
  description = "secondary AZ"
  default     = ""
}
