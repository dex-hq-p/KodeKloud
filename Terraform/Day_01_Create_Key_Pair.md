###
> For this task, create a key pair using Terraform with the following requirements:
> Name of the key pair should be nautilus-kp.
> Key pair type must be rsa.
> The private key file should be saved under /home/bob/nautilus-kp.pem.
> The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

```
resource "tls_private_key" "key_pair_type" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_sensitive_file" "private_key" {
  content  = tls_private_key.key_pair_type.private_key_pem
  filename = "/home/bob/nautilus-kp.pem"
}

resource "aws_key_pair" "nautilus_kp" {
  key_name   = "nautilus-kp"
  public_key = tls_private_key.key_pair_type.public_key_openssh
}
```