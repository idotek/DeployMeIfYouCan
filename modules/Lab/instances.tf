resource "aws_instance" "Lab-Instances" {
  for_each = var.instances
  instance_type = each.value.instance_type
  ami = each.value.ami
  user_data = file("./modules/Lab/Cloud-Init/app.sh")
  subnet_id = local.Subnet[each.key]
  vpc_security_group_ids = [aws_security_group.Lab-WebNSG.id]
  key_name = "${var.ProjectName}-lab"
  tags = {
    Name = each.value.name
  }
}