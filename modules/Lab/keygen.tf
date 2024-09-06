# Create admin server key pair
resource "tls_private_key" "lab_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# Create admin key_pair
resource "aws_key_pair" "gen_lab_public_key" {
  key_name   = "${var.ProjectName}-lab"
  public_key = tls_private_key.lab_key_pair.public_key_openssh
}

resource "local_sensitive_file" "gen_lab_private_key" {
  content         = tls_private_key.lab_key_pair.private_key_pem
  filename        = "lab.pem"
  file_permission = "400"
}