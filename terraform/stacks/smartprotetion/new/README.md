# Base stack


## Remote S3 Backend
* AWS Account: smart-ops
* Bucket S3: sp-sre-terraform/smart/base/workspace_name/terraform.tfstate
* Encrypted: enable (server side encryption)
* DynamoDB State Lock: disabled

## Inputs

#### **aws_region** `string`

AWS Region

#### **project** `string`

Stack project name

#### **tags** `list(map(string))`

AWS tags for resources

## Outputs

#### **database_route_table_ids**

List of IDs of database route tables

#### **database_subnets**

List of IDs of database subnets

#### **database_subnets_cidr_blocks**

List of cidr_blocks of database subnets

#### **ecs_cluster_arn**

ARN of the ECS Cluster

#### **ecs_cluster_id**

ID of the ECS Cluster

#### **ecs_cluster_name**

The name of the ECS cluster

#### **igw_id**

The ID of the Internet Gateway

#### **natgw_ids**

List of NAT Gateway IDs

#### **private_route_table_ids**

List of IDs of private route tables

#### **private_subnets**

List of IDs of private subnets

#### **private_subnets_cidr_blocks**

List of cidr_blocks of private subnets

#### **public_route_table_ids**

List of IDs of public route tables

#### **public_subnets**

List of IDs of public subnets

#### **public_subnets_cidr_blocks**

List of cidr_blocks of public subnets

#### **vpc_cidr**

The CIDR block of the VPC

#### **vpc_flow_log_id**

The ID of the Flow Log resource

#### **vpc_id**

The ID of the VPC

