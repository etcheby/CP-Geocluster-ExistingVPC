#####################################
######### Transit GW  ###############
#####################################

# Create the TGW
resource "aws_ec2_transit_gateway" "transit_gateway" {
  description = "TGW to demo Check Point Geocluster"
  auto_accept_shared_attachments = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  tags = {
    Name        = ""
  }
}

#####################################
#######  TGW Attachments ############
#####################################

# Attach Security VPC to the TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "security_attachment" {
  subnet_ids         = ["${var.tgw_subnet1.id}","${var.tgw_subnet2.id}"]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = var.geocluster_vpc
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "Security-Attachment"
  }
}
