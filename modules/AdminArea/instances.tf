resource "aws_instance" "AdminArea-Instance" {
  instance_type = var.Instance.instance_type
  ami = var.Instance.ami
  user_data = file("./modules/AdminArea/Cloud-Init/admin.yaml")
  subnet_id = aws_subnet.AdminArea-Subnet.id
  key_name = "admin"
  tags = {
    Name = var.Instance.name
  }
}

