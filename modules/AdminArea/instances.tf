resource "aws_instance" "AdminArea-Instance" {
  instance_type = var.Instance.instance_type
  ami = var.Instance.ami
  user_data = file("./modules/AdminArea/Cloud-Init/admin.yaml")
  subnet_id = aws_subnet.AdminArea-Subnet.id
  vpc_security_group_ids = [aws_security_group.AdminArea-NSG.id]
  key_name = "admin"
  tags = {
    Name = var.Instance.name
  }
}

