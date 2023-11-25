terraform {
  backend "local" {
    workspace_dir = "state/terraform.tfstate.d"
  }
}
