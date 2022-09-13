#tags module
module "tags" {
  source     = "./modules/tags"
  env        = var.env
  automation = "terraform"
  other      = {}
}

#tags output
output "tags" { value = module.tags.map }
