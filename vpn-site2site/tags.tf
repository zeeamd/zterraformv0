#tags module
module "tags" {
  source     = "../modules/tags"
  automation = "terraform"
  other      = {}
}

#tags output
output "tags" { value = module.tags.map }
