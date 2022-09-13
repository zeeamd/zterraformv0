#instance
resource "aws_instance" "ec2-v0" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  tags = merge(module.tags.map,{
   Name = "TestTagMod"
  })
}
