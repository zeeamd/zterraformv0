## This block tests for each loop with conditions
locals {
  x = ["pos1","pos2"]
}

resource "null_resource" "testblock" {
  
 for_each = {
    for y in local.x : y => y
    if contains(local.x, "pos1")
  }

  provisioner "local-exec" {
    command = <<EOT
      echo  ${each.key}
    EOT
  }
}
