#standard tags output
output "map" {
 value = merge(
  var.other,
   {
    env = var.env,
    automation = var.automation
   }
  )
}
