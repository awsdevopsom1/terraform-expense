# resource "aws_lb" "main" {
#   name               = "${var.env}-${var.type}"
#   internal           = var.internal
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.lb_sg.id]
#   subnets            = [for subnet in aws_subnet.public : subnet.id]

#   enable_deletion_protection = true

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "test-lb"
#     enabled = true
#   }

#   tags = {
#     Environment = "production"
#   }
# }

# variable "env" {}
# variable "type" {}
# variable "internal" {}
