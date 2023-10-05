resource "aws_instance" "jenkins_host" {
  ami             = var.ami
  instance_type   = var.instance
  security_groups = [aws_security_group.jenkins-sg.name]
  user_data = <<EOF
   #!/bin/bash
   sudo yum update -y
   sudo yum install java-11-amazon-corretto-headless
   sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
   sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
   sudo yum install jenkins -y
   sudo systemctl start jenkins
   sudo systemctl enable jenkins
  EOF

  tags = {
    "Name" = var.servername
  }

}