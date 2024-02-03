packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
        access_key = "AKIA2UC3EEWRPCV4BR7C"
        secret_key ="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"
        ami_name      = "golden-ami-${formatdate("YYYY-MM-DD-hhmmss", timestamp())}"
        instance_type = "t2.micro"
        region        = "ap-south-1"
        source_ami = "ami-03f4878755434977f"
        ssh_username = "ubuntu"
        associate_public_ip_address = "true"
        subnet_id = "subnet-0e317a8dd7fc6a7d2"
        vpc_id = "vpc-0a035628ef41db634"
        tags = {
                 Name = "golden-ami"
  }
}


build {
  name = "e2esa-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}
