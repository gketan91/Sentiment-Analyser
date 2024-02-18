provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAWTBVYIFNNG5I72NJ"
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
