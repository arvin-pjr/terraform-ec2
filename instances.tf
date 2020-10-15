provider "aws" {
  region              = var.aws_region
#  access_key          = var.aws_access_key
#  secret_key          = var.aws_secret_key
}
resource "aws_instance" "prometheus" {
  ami                                = "ami-0a248ce88bcc7bd23"
  instance_type                      = "t2.micro"
  security_groups                    = ["launch-wizard-1"]
  key_name                           = var.keypair

  user_data                          = file("userdata-ec2.sh")
  tags = {
    Name="${var.mode}-${var.environment}"
  }
}

#resource "aws_instance" "node-exporter-1" {
#  ami                                = "ami-0a248ce88bcc7bd23"
#  instance_type                      = "t2.micro"
#  security_groups                    = ["launch-wizard-1"]
#  key_name                           = "west2"

#  user_data                          = file("userdata-ec2.sh")
#  tags = {
#    Name="${var.node1_mode}-${var.environment}"
#  }
#}

#resource "aws_instance" "node-exporter-2" {
#  ami                                = "ami-0a248ce88bcc7bd23"
#  instance_type                      = "t2.micro"
#  security_groups                    = ["launch-wizard-1"]
#  key_name                           = "west2"

#  user_data                          = file("userdata-ec2.sh")
#  tags = {
#    Name="${var.node2_mode}-${var.environment}"
#  }
#}

output "prometheus_ip" {
  value = "${aws_instance.prometheus.public_ip}"
}
