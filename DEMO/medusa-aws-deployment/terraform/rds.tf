resource "aws_db_subnet_group" "medusa" {

  name       = "medusa-db-subnet-group"
  subnet_ids = aws_subnet.public[*].id
  tags = {
    Name = "medusa-db-subnet-group"
  }
}

resource "aws_db_instance" "medusa" {
  identifier              = "medusa-db"
  allocated_storage       = 20
  engine                  = "postgres"
  engine_version          = "17.4"
  instance_class          = "db.t3.micro"
   username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.medusa.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  publicly_accessible     = true
  skip_final_snapshot     = true
  delete_automated_backups = true
  tags = {
    Name = "medusa-postgres"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "medusa-rds-sg"
  description = "Allow access to PostgreSQL"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "medusa-rds-sg"
  }
}