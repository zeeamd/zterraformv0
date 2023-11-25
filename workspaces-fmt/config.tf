## Declare local values including env specific values

locals {
  ## This list contains expected workspaces.  Running a plan against a workspace not in this list will result in an error
  valid_workspaces = {
    dev = "dev"
    poc = "poc"
  }

  ## An error on this line indicates an unexpected workspace value
  selected_workspace = local.valid_workspaces[terraform.workspace]

  default_tags = {
    "env_type" = local.config["env_type"]
    "purpose"  = "test"
  }

  ## Add env config maps here to add them to config object
  config = local.environment_config[local.selected_workspace]
  environment_config = {
    dev = local.dev
    poc = local.poc
  }
}

## terraform workspace new dev
