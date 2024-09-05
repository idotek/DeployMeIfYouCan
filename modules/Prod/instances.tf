resource "aws_instance" "Prod-Instances" {
  for_each = var.instances
  instance_type = each.value.instance_type
  ami = each.value.ami
  user_data = file("./modules/Prod/Cloud-Init/app.yaml")
  subnet_id = local.Subnet[each.value.name]
  vpc_security_group_ids = aws_security_group.Prod-WebNSG.id
  tags = {
    Name = each.value.name
  }
}