# Output the DNS name of the public Elastic Load Balancer
output "public-elb-dns" {
  value = module.elbs.public-elb-dns
}

# Output the DNS name of the private Elastic Load Balancer
output "private-elb-dns" {
  value = module.elbs.private-elb-dns
}

# Output the public IP of the first public instance
output "public_instance_1_public_ip" {
  value = module.instances.public_instance_1_public_ip
}

# Output the public IP of the second public instance
output "public_instance_2_public_ip" {
  value = module.instances.public_instance_2_public_ip
}

# Output the private IP of the first private instance
output "private_instance_1_private_ip" {
  value = module.instances.private_instance_1_private_ip
}

# Output the private IP of the second private instance
output "private_instance_2_private_ip" {
  value = module.instances.private_instance_2_private_ip
}
