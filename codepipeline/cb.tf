resource "aws_codebuild_project" "codebuild-project-v0" {
  name          = var.cbnamev0
  build_timeout = "5"
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    image        = "aws/codebuild/standard:6.0"
    compute_type = "BUILD_GENERAL1_SMALL"
    type         = "LINUX_CONTAINER"
  }

  source {
    type      = "CODEPIPELINE"
  }
}

data "template_file" "deploy_script" {
  template = file("files/buildspec-D2L.yaml.tpl")
  vars = {
    lambda_name     = var.lambda2update
    artifact_bucket = var.cpbucket
    artifact        = var.deploys3objectkey
  }
}

resource "aws_codebuild_project" "codebuild-project-v1" {
  name          = var.cbnamev1
  build_timeout = "5"
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    image        = "aws/codebuild/standard:6.0"
    compute_type = "BUILD_GENERAL1_SMALL"
    type         = "LINUX_CONTAINER"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = data.template_file.deploy_script.rendered
  }
}
