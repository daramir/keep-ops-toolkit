resource "aws_security_group" "allow-grafana-prometheus" {
  name        = "allow-grafana-prometheus"
  description = "Allow Grafana Monitoring (Terraform-managed)"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = var.grafana_cloud_static_ips
  }
}

resource "aws_security_group" "allow-grafana-loki" {
  name        = "allow-grafana-loki"
  description = "Allow Grafana Monitoring (Terraform-managed)"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port   = 3100
    to_port     = 3100
    protocol    = "tcp"
    cidr_blocks = var.grafana_cloud_static_ips
  }
}

