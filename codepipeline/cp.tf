resource "aws_codepipeline" "codepipeline" {
  name     = var.cpname
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        RepositoryName = var.repo
        BranchName     = var.branch
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = var.cbnamev0
      }
    }
  }

  stage {
    name = "Deploy2S3"

    action {
      name            = "Deploy2S3"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
         BucketName = aws_s3_bucket.codepipeline_bucket.bucket
         ObjectKey  = var.deploys3objectkey
         Extract    = "false"
      }
    }
  }

  stage {
    name = "Approve2Deploy"
  
    action {
      name     = "Approval"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"
  
      configuration     = {
        NotificationArn = var.approve_sns_arn
      }
    }
  }
   

  stage {
    name = "Deploy2Lambda"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = var.cbnamev1
      }
    }
  }

}

