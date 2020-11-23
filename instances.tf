resource "aws_instance" "xhibit" {
  ami             = "ami-0a248ce88bcc7bd23"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-1"]
  key_name        = var.keypair

  user_data = file("userdata.sh")
  tags = {
    Name = "${var.app}-${var.environment}"
  }
}

output "instance_ip" {
  value = aws_instance.xhibit.public_ip
}
