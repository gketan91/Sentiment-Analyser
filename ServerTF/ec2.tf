provider "aws" {
  region     = "ap-south-1"
  access_key = "***"
  secret_key = "***"
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.large"
  key_name      = "webserverkeypair"

  user_data = templatefile("./tools-install.sh", {})

  tags = {
    Name = "JenkinsServer"
  }
}
