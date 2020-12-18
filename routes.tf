###############################
### TGWHA Public Subnets RT ###
###############################
# This section is commented out as you may already have RT for public subnets pointing to IGW
# Uncomment only if need to create. 

# Create Public Subnets RT

#resource "aws_route_table" "public_subnets_rt" {
#  vpc_id     = var.geocluster_vpc
#
#    # Route to the internet
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = var.geocluster_igw 
#  }

#tags = {
#    Name = "Public Subnets"
#  }
#}

# Public Subnets Route Table Association

resource "aws_route_table_association" "public_subnet1_rt_association" {
  subnet_id      = var.public_subnet1
  route_table_id = var.tgwha_public_rt
}

resource "aws_route_table_association" "public_subnet2_rt_association" {
  subnet_id      = var.public_subnet2
  route_table_id = var.tgwha_public_rt
}

####################################
###### Internet Gateways  ##########
####################################
# Commented out because eisting VPC might already have one. 
# Uncomment only if need to create IGW on existing VPC

#resource "aws_internet_gateway" "geocluster_igw" {
#  vpc_id = var.geocluster_vpc
#
#  tags = {
#    Name = "Geocluster-IGW"
#  }
#}

########################################################
######## TGW - Security VPC Attachment Route Table #####
########################################################

# Creates a TGW RT for Security attachment

resource "aws_ec2_transit_gateway_route_table" "tgw_security_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  tags = {
    Name        = "TGW Security"
  }
}

# Associates the geocluster security VPC attachment to this TGW RT

resource "aws_ec2_transit_gateway_route_table_association" "tgw_security_attachment_association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_security_rt.id
} 
