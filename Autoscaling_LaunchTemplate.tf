provider "aws" {
    access_key = "AKIA2UC3EEWRPCV4BR7C"
    secret_key= "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"
    region = "ap-south-1"
}

#To fetch the latest AMI
data "aws_ami" "my-goldenami" {
  most_recent = true
  
 filter {
    name   = "golden-ami"
    values = ["golden-ami-*"]
  }
}

#launch template resource
resource "aws_launch_template" "terraform-LT" {
  name_prefix   = "terraform-LT"
  image_id      = data.aws_ami.my-goldenami.id
  instance_type = "t2.micro"
}

#AutoScaling Block
resource "aws_autoscaling_group" "terraform-ASG" {
  name                      = "terraform-ASG"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  #placement_group           = aws_placement_group.test.id
  launch_template {
    id      = aws_launch_template.terraform-LT.id
    version ="$Latest"
  }
  
    tag {
    key                 = "terraform"
    value               = "ASG"
  }
}
