#########################################
############# Variables #################
#########################################

# Geo-Cluster VPC & Subnets

variable "geocluster_vpc" {
  description = "Check Point Geocluster VPC ID"
  default     = ""
}

variable "public_subnet1" {
  description = "Geocluster VPC Public Subnet AZ1 ID"
  default     = ""
}

variable "public_subnet2" {
  description = "Geocluster VPC Public Subnet AZ2 ID"
  default     = ""
}

variable "private_subnet1" {
  description = "Geocluster VPC Private Subnet AZ1 ID"
  default     = ""
}

variable "private_subnet2" {
  description = "Geocluster VPC Private Subnet AZ2 ID"
  default     = ""
}

variable "tgw_subnet1" {
  description = "Geocluster VPC TGW Subnet AZ1 ID"
  default     = ""
}

variable "tgw_subnet2" {
  description = "Geocluster VPC TGW Subnet AZ2 ID"
  default     = ""
}

variable "geocluster_igw" {
  description = "Existing VPC IGW ID"
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
  default     = ""
}

variable "mgmt_instance_type" {
  default = ""
}

variable "gateway_instance_type" {
  default = ""
}

variable "primary_az" {
  description = "primary AZ"
  default     = ""
}

variable "secondary_az" {
  description = "secondary AZ"
  default     = ""
}
