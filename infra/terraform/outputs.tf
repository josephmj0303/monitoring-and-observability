output "web_ip" {
  value = aws_instance.web.public_ip
}

output "prometheus_ip" {
  value = aws_instance.prometheus.public_ip
}

output "grafana_ip" {
  value = aws_instance.grafana.public_ip
}

output "loki_ip" {
  value = aws_instance.loki.public_ip
}
