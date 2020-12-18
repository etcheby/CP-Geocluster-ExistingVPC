# Deploy Check Point Geo-Cluster in an existing VPC 
# From SK111013, download template YAML to review which parameters you'd like to customize,.  

resource "aws_cloudformation_stack" "checkpoint_geocluster" {
  name = "CP-Geocluster"

  parameters = {
    VPC                     = var.geocluster_vpc
    PublicSubnetA           = var.public_subnet1
    PublicSubnetB           = var.public_subnet2
    PrivateSubnetA          = var.private_subnet1
    PrivateSubnetB          = var.private_subnet2
    TgwHASubnetA            = var.tgw_subnet1
    TgwHASubnetB            = var.tgw_subnet2
    InternalRouteTable      = var.tgwha_private_rt
    GatewayName             = var.gateway_name
    GatewayInstanceType     = var.gateway_instance_type
    KeyName                 = var.key_name
    AllocatePublicAddress   = "true"
    VolumeSize              = "100"
    VolumeEncryption        = var.kmskey_identifier
    EnableInstanceConnect   = "true"
    GatewayPredefinedRole   = var.gateway_iamrole
    GatewayVersion          = "${var.cpversion}-BYOL"
    GatewayPasswordHash     = var.password_hash
    Shell                   = "/bin/bash"
    GatewaySICKey           = var.sic_key
    GatewayHostname         = var.gateway_hostname
    AllowUploadDownload     = "true"
    NTPPrimary              = "169.254.169.123"
    NTPSecondary            = "0.pool.ntp.org"
    GatewayBootstrapScript  = ""
    
}

  template_url        = "https://cgi-cfts.s3.amazonaws.com/cluster/tgw-ha.yaml"
  capabilities        = ["CAPABILITY_IAM"]
  disable_rollback    = true
  timeout_in_minutes  = 30
}
