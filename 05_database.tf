resource "aws_db_subnet_group" "main" {
  name       = "${local.project}-db-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = merge(local.common_tags, {
    Name = "${local.project}-db-subnet-group"
  })
}

resource "aws_db_instance" "main" {
  identifier                = "${local.project}-mysql"
  engine                    = "mysql"
  engine_version            = "8.0"
  instance_class            = var.db_instance_class
  allocated_storage         = var.db_allocated_storage
  db_name                   = var.db_name
  username                  = var.db_username
  password                  = var.db_password
  port                      = 3306
  db_subnet_group_name      = aws_db_subnet_group.main.name
  vpc_security_group_ids    = [aws_security_group.rds.id]
  publicly_accessible       = false
  multi_az                  = false
  storage_type              = "gp2"
  backup_retention_period   = 0
  skip_final_snapshot       = true
  deletion_protection       = false
  auto_minor_version_upgrade = true

  tags = merge(local.common_tags, {
    Name = "${local.project}-rds"
  })
}