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
  security_groups = [ "My-CustomSG" ]
  tags = {
    Name = "JenkinsServer"
  }
  ebs_block_device {
    device_name = "/dev/sda1"  # Adjust if your root device is different
    volume_size = 16          # Increase size to 16 GiB

    # Reference the existing volume (optional, if volume already exists)
    # volume_id = aws_ebs_volume.jenkins_data.id
  }
}

resource "aws_iam_role" "cluster_role" {
  name = "cluster_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
