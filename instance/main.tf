provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "ssh_conection" {
  name = var.sg_name
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = var.tags
}

resource "aws_instance" "platzi-instance" {
  #ami           = "ami-07dace18206246193"
  ami = var.ami_id
  #instance_type = "t2.micro"
  instance_type = var.instance_type
  #tags = {
  #  Name        = "practica1"
  #  Environment = "Dev"
  #}
  tags            = var.tags
  security_groups = ["${aws_security_group.ssh_conection.name}"]
}

output "instance_ip" {
  value       = aws_instance.platzi-instance.*.public_ip
  description = "The private IP address of the main server instance."
}