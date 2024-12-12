output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "eks_cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = module.rds.db_instance_endpoint
}

output "rds_port" {
  description = "The port the RDS instance is listening on"
  value       = module.rds.db_instance_port
}