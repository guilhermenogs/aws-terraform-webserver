# AWS Infrastructure Provisioning

![Terraform](https://img.shields.io/badge/Terraform-v1.0+-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

Repositório contendo a implementação de **Infraestrutura como Código (IaC)** para provisionamento de servidores web na AWS. O projeto foca em automação, segurança de estado e pipelines de integração contínua.

---

## Sobre o Projeto

Este projeto demonstra a automação completa do ciclo de vida de uma infraestrutura em nuvem. O código provisiona uma instância EC2 rodando Nginx, configurada via *User Data*, com gerenciamento de estado remoto seguro.

O objetivo principal foi aplicar práticas modernas de **DevOps** para eliminar processos manuais e garantir a consistência do ambiente.

---

## Tecnologias e Ferramentas

* **Infrastructure as Code:** Terraform (HCL)
* **Cloud Provider:** AWS (Amazon Web Services)
* **Automação & CI:** GitHub Actions
* **Servidor Web:** Nginx (Linux Ubuntu)
* **Scripting:** Bash

---

## Destaques da Arquitetura

### 1. Remote State & Locking Strategy
Para garantir a segurança e integridade do estado da infraestrutura (state file), foi implementada uma estratégia de **Backend Remoto**:
* **Armazenamento:** O arquivo `terraform.tfstate` é armazenado em um Bucket S3 criptografado, removendo a dependência de arquivos locais.
* **Concorrência:** Utilização de uma tabela no **DynamoDB** para gerenciamento de *State Locking*, impedindo condições de corrida e escritas simultâneas no estado.

### 2. Pipeline de CI/CD (GitHub Actions)
A qualidade do código é assegurada por uma esteira de integração contínua definida em `.github/workflows/terraform.yml`, que executa automaticamente:
* **Linting:** Verificação de formatação (`terraform fmt`).
* **Validação:** Checagem de sintaxe e integridade dos arquivos (`terraform validate`).
* **Planejamento:** Execução especulativa (`terraform plan`) para revisão de mudanças antes do merge.

### 3. Provisionamento Seguro
* **Security Groups:** Princípio do menor privilégio, liberando apenas portas essenciais (80/HTTP e 22/SSH).
* **Imutabilidade:** O servidor é provisionado e configurado automaticamente no boot, sem necessidade de intervenção manual via SSH.

