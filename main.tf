####################################
###### Internet Gateways  ##########
####################################

resource "aws_internet_gateway" "geocluster_igw" {
  vpc_id = var.geocluster_vpc

  tags = {
    Name = "Geocluster-IGW"
  }
}
