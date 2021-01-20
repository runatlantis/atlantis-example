# VPC
output "database_route_table_ids" { value = module.vpc.database_route_table_ids }
output "database_subnets" { value = module.vpc.database_subnets }
output "database_subnets_cidr_blocks" { value = module.vpc.database_subnets_cidr_blocks }
output "igw_id" { value = module.vpc.igw_id }
output "natgw_ids" { value = module.vpc.natgw_ids }
output "private_route_table_ids" { value = module.vpc.private_route_table_ids }
output "private_subnets" { value = module.vpc.private_subnets }
output "private_subnets_cidr_blocks" { value = module.vpc.private_subnets_cidr_blocks }
output "public_route_table_ids" { value = module.vpc.public_route_table_ids }
output "public_subnets" { value = module.vpc.public_subnets }
output "public_subnets_cidr_blocks" { value = module.vpc.public_subnets_cidr_blocks }
output "vpc_cidr" { value = module.vpc.vpc_cidr_block }
output "vpc_flow_log_id" { value = module.vpc.vpc_flow_log_id }
output "vpc_id" { value = module.vpc.vpc_id }

# ECS Cluster
output "ecs_cluster_arn" { value = module.ecs_cluster.this_ecs_cluster_arn }
output "ecs_cluster_id" { value = module.ecs_cluster.this_ecs_cluster_id }
output "ecs_cluster_name" { value = module.ecs_cluster.this_ecs_cluster_name }
