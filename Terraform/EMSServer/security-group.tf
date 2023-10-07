# Security Group
variable "ingressports" {
  type    = list(number)
  default = [8080, 22, 3000, 5432]
}

resource "aws_security_group" "ems-sg" {
  name        = "Allow ems traffic"
  description = "inbound ports for ssh and standard http and everything outbound"
  dynamic "ingress" {
    for_each = var.ingressports
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }s
  tags = {
    "Name"      = "EMS-sg"
    "Terraform" = "true"
  }
}