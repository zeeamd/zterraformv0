data "aws_ec2_transit_gateway" "tgw" {
  filter {
    name   = "options.amazon-side-asn"
    values = ["64512"]
  }

  filter {
    name   = "options.dns-support"
    values = ["enable"]
  }

  filter {
    name   = "options.auto-accept-shared-attachments"
    values = ["enable"]
  }

  filter {
    name   = "options.vpn-ecmp-support"
    values = ["enable"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

output "tgw_id" {
  value = data.aws_ec2_transit_gateway.tgw.id
}

