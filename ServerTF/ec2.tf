provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAWTBVYIFNDLYIQFUF"
  secret_key = "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"
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.medium"
  key_name      = "webserverkeypair"

  user_data = templatefile("./tools-install.sh", {})

  tags = {
    Name = "JenkinsServer"
  }
}
