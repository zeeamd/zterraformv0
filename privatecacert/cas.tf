resource "aws_acmpca_certificate_authority" "subordinate" {
  certificate_authority_configuration {
    key_algorithm     = "RSA_4096"
    signing_algorithm = "SHA512WITHRSA"

    subject {
      common_name = var.common_name
    }
  }
   
  permanent_deletion_time_in_days = 7
}

resource "aws_acmpca_permission" "subordinate" {
  certificate_authority_arn = aws_acmpca_certificate_authority.subordinate.arn
  actions                   = ["IssueCertificate", "GetCertificate", "ListPermissions"]
  principal                 = "acm.amazonaws.com"
}

resource "aws_acmpca_certificate" "subordinate" {
  certificate_authority_arn   = aws_acmpca_certificate_authority.root.arn
  certificate_signing_request = aws_acmpca_certificate_authority.subordinate.certificate_signing_request
  signing_algorithm           = "SHA512WITHRSA"

  template_arn = "arn:${data.aws_partition.current.partition}:acm-pca:::template/SubordinateCACertificate_PathLen0/V1"

  validity {
    type  = "YEARS"
    value = 2
  }
}

resource "aws_acmpca_certificate_authority_certificate" "subordinate" {
  certificate_authority_arn = aws_acmpca_certificate_authority.subordinate.arn
  certificate       = aws_acmpca_certificate.subordinate.certificate
  certificate_chain = aws_acmpca_certificate.subordinate.certificate_chain
}
