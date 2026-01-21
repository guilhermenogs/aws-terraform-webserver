output "site_url" {
  description = "Acesse seu site clicando aqui:"
  value       = "http://${aws_instance.web_server.public_ip}"
}