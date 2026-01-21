variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "projeto" {
  description = "Nome do projeto para usar nas Tags"
  type        = string
  default     = "Projeto-Terraform"
}

