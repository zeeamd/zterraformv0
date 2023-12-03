resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "cw-dashboard-sample"

  dashboard_body = templatefile("${path.module}/templates/cw-dashboard-body.json.tftpl", {
    widgets = var.widgets
  })
}

# ## block to club multiple json files into one
# resource "aws_cloudwatch_dashboard" "main" {
#   dashboard_name = "cw-dashboard-sample"

#   dashboard_body = <<EOF
# {
#   "widgets" : [
#       ${templatefile("${path.module}/templates/cw-db-body-1.json.tftpl", {
#   widgets = var.widgets
#   })},
#       ${templatefile("${path.module}/templates/cw-db-body-2.json.tftpl", {
#   widgets = var.widgets
# })}
#   ]
# }
# EOF
# }


