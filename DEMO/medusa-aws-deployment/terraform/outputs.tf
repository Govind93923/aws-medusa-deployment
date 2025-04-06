output "load_balancer_dns_name" {
  value = aws_lb.medusa.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.medusa.name
}

output "rds_endpoint" {
  value = aws_db_instance.medusa.endpoint
}
