variable "project_name" {
  type    = string
  default = "cta-sprint5"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "region" {
  type    = string
  default = "ap-northeast-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "ecr_repository_name" {
  type    = string
  default = "sprint5-api"
}

variable "container_name" {
  type    = string
  default = "meibo-api"
}

variable "container_port" {
  type    = number
  default = 80
}

variable "ecs_cpu" {
  type    = number
  default = 256
}

variable "ecs_memory" {
  type    = number
  default = 512
}

variable "desired_count" {
  type    = number
  default = 2
}

variable "min_capacity" {
  type    = number
  default = 2
}

variable "max_capacity" {
  type    = number
  default = 4
}

variable "db_name" {
  type    = string
  default = "meibo"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "health_check_path" {
  type    = string
  default = "/health"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR allowed to access bastion via SSH"
  default     = "0.0.0.0/0"
}

variable "bastion_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name for bastion host"
}