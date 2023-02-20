resource "aws_acmpca_certificate_authority" "acmpcar" {
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

resource "aws_acmpca_permission" "acmpap" {
  certificate_authority_arn = aws_acmpca_certificate_authority.acmpcar.arn
  actions                   = ["IssueCertificate", "GetCertificate", "ListPermissions"]
  principal                 = "acm.amazonaws.com"
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_cert_request" "csr" {
#  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.key.private_key_pem

  subject {
    common_name = var.common_name
  }
}

#resource "aws_acmpca_certificate" "acmpac" {
#  certificate_authority_arn   = aws_acmpca_certificate_authority.acmpcar.arn
#  certificate_signing_request = tls_cert_request.csr.cert_request_pem
#  signing_algorithm           = "SHA256WITHRSA"
#  validity {
#    type  = "YEARS"
#    value = 1
#  }
#}

#resource "aws_acmpca_certificate_authority_certificate" "acmpai" {
#  certificate_authority_arn = aws_acmpca_certificate_authority.acmpcar.arn
#  certificate       = aws_acmpca_certificate.acmpac.certificate
#  certificate_chain = aws_acmpca_certificate.acmpac.certificate_chain
#}

