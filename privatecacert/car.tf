resource "aws_acmpca_certificate_authority" "root" {
  certificate_authority_configuration {
    key_algorithm     = "RSA_4096"
    signing_algorithm = "SHA512WITHRSA"

    subject {
      common_name = var.common_name
    }
  }
   
  type = "ROOT"
  permanent_deletion_time_in_days = 7
}

resource "aws_acmpca_permission" "root" {
  certificate_authority_arn = aws_acmpca_certificate_authority.root.arn
  actions                   = ["IssueCertificate", "GetCertificate", "ListPermissions"]
  principal                 = "acm.amazonaws.com"
}

#resource "tls_private_key" "key" {
#  algorithm = "RSA"
#  rsa_bits  = 4096
#}

#resource "tls_cert_request" "csr" {
##  key_algorithm   = "RSA"
#  private_key_pem = tls_private_key.key.private_key_pem
#
#  subject {
#    common_name = var.common_name
#  }
#}

#resource "aws_acmpca_certificate" "acmpac" {
#  certificate_authority_arn   = aws_acmpca_certificate_authority.root.arn
#  certificate_signing_request = tls_cert_request.csr.cert_request_pem
#  signing_algorithm           = "SHA256WITHRSA"
#  validity {
#    type  = "YEARS"
#    value = 1
#  }
#}

data "aws_partition" "current" {}

resource "aws_acmpca_certificate" "root" {
  certificate_authority_arn   = aws_acmpca_certificate_authority.root.arn
  certificate_signing_request = aws_acmpca_certificate_authority.root.certificate_signing_request
  signing_algorithm           = "SHA512WITHRSA"

  template_arn = "arn:${data.aws_partition.current.partition}:acm-pca:::template/RootCACertificate/V1"

  validity {
    type  = "YEARS"
    value = 3
  }
}

resource "aws_acmpca_certificate_authority_certificate" "root" {
  certificate_authority_arn = aws_acmpca_certificate_authority.root.arn
  certificate       = aws_acmpca_certificate.root.certificate
  certificate_chain = aws_acmpca_certificate.root.certificate_chain
}
