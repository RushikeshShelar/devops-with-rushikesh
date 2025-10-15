resource "aws_db_instance" "rds" {
  identifier             = "modular-rds"
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  allocated_storage      = 20
  username               = var.db_user
  password               = var.db_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.sg_id]
  db_subnet_group_name   = var.db_subnet_group

  tags = {
    Name = "modular-rds"
  }
}
