variable "project_id" {
  type        = string
  description = "GCP project ID"
  default     = "gelugu-default"
}

variable "region" {
  type    = string
  default = "europe-west3"
}

variable "cluster_name" {
  type    = string
  default = "hello-world"
}
