# Output the ARN of the public target group
output "public-target-group-arn" {
  value = aws_lb_target_group.public_tg.arn
}

# Output the ARN of the private target group
output "private-target-group-arn" {
  value = aws_lb_target_group.private_tg.arn
}

# Output the DNS name of the public Elastic Load Balancer
output "public-elb-dns" {
  value = aws_lb.public_alb.dns_name
}

# Output the DNS name of the private Elastic Load Balancer
output "private-elb-dns" {
  value = aws_lb.private_alb.dns_name
}
