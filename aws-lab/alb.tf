data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  vpc      = true
}

resource "aws_lb" "external-lb" {
  name                             = "External-LB"
  load_balancer_type               = "application"
  internal                         = false
  enable_cross_zone_load_balancing = "true"
  security_groups    = [aws_security_group.web-security-group.id]

  subnets            = data.aws_subnets.default.ids
}
