# Create admin server key pair
resource "tls_private_key" "admin_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# Create admin key_pair
resource "aws_key_pair" "gen_admin_public_key" {
  key_name   = "admin"
  public_key = tls_private_key.admin_key_pair.public_key_openssh
}

resource "local_sensitive_file" "gen_admin_private_key" {
  content         = tls_private_key.admin_key_pair.private_key_pem
  filename        = "admin.pem"
  file_permission = "400"
}

