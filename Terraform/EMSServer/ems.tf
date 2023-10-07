resource "aws_instance" "ems_host" {
  ami             = var.ami
  instance_type   = var.instance
  security_groups = [aws_security_group.ems-sg.name]
  user_data = <<EOF
  #!/bin/bash
  #install docker
  sudo dnf update -y
  sudo dnf install docker -y
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose 
  EOF

  tags = {
    "Name" = var.servername
  }

}