#########################
### Public Subnets RT ###
#########################

# Create Public Subnets RT

resource "aws_route_table" "public_subnets_rt" {
  vpc_id     = var.geocluster_vpc

    # Route to the internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.geocluster_igw
  }

tags = {
    Name = "Public Subnets"
  }
}

# Public Subnets Route Table Association

resource "aws_route_table_association" "public_subnet1_rt_association" {
  subnet_id      = var.public_subnet1
  route_table_id = aws_route_table.public_subnets_rt.id
}

resource "aws_route_table_association" "public_subnet2_rt_association" {
  subnet_id      = var.public_subnet2
  route_table_id = aws_route_table.public_subnets_rt.id
}

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

