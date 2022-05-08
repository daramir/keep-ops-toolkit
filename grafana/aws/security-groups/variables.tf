variable "aws_vpc_id" {
  description = "The VPC where the Keep nodes are running"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "The AWS region hosting this infrastructure"
  type        = string
  default     = ""
}


variable "grafana_cloud_static_ips" {
  type        = list(string)
  description = "The IPs listed in https://grafana.com/docs/grafana-cloud/reference/allow-list"
  default     = []
}
