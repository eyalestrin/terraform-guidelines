resource "aws_launch_configuration" "My_Launch_Configuration" {
  name                 = "My_Launch_Configuration"
  instance_type        = "t2.micro"
  image_id             = "ami-09d3b3274b6c5d4aa"
  security_groups      = [aws_security_group.web-security-group.id]
  key_name = "johnbryce-private-key"
  user_data = <<-EOF
	#!/bin/bash
	sudo yum update -y
	sudo yum install ec2-instance-connect -y
	sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
	sudo systemctl start amazon-ssm-agent
	sudo amazon-linux-extras install nginx1 -y
	sudo systemctl start nginx
  EOF
}
