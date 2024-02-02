packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  access_key = "AKIA2UC3EEWRHTKZVAGR"
  secret_key ="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"
  ami_name      = "golden-ami"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami = "ami-03f4878755434977f"
  ssh_username = "ubuntu"
}

build {
  name = "e2esa-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}
