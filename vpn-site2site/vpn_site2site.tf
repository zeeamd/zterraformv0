module "vpn-site2site" {
  source                   = "../modules/vpn-site2site"
  on-prem-router-public-ip = var.on-prem-router-public-ip
  cw_lg_retention_days     = var.cw_lg_retention_days
  tags                     = merge(module.tags.map,{
                                   Owner = "Zee"
                                 })
}
