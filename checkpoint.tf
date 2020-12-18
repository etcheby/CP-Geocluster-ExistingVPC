# Deploy Check Point Geo-Cluster cloudformation template - (existing VPC) 
# From SK111013, download template 9 YAML to review which parameters you'd like to customize,.  

resource "aws_cloudformation_stack" "checkpoint_geocluster_stack" {
  name = "Geocluster"

  parameters = {
    VPC                     = var.geocluster_vpc
    PublicSubnetA           = var.public_subnet1
    PublicSubnetB           = var.public_subnet2
    PrivateSubnetA          = var.private_subnet1
    PrivateSubnetB          = var.private_subnet2
    TgwHASubnetA            = var.tgw_subnet1
    TgwHASubnetB            = var.tgw_subnet2
    InstanceType            = var.gateway_instance_type
    KeyName                 = var.key_name
    License                 = "${var.cpversion}-BYOL"
    PasswordHash            = var.password_hash
    Shell                   = "/bin/bash"
    SICKey                  = ""
    EnableInstanceConnect   = "true"
}

  template_url        = "https://cgi-cfts.s3.amazonaws.com/cluster/tgw-ha.yaml"
  capabilities        = ["CAPABILITY_IAM"]
  disable_rollback    = true
  timeout_in_minutes  = 30
}
