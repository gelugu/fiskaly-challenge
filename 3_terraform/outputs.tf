output "cluster_endpoint" {
  value     = google_container_cluster.main.endpoint
  sensitive = true
}

output "cluster_name" {
  value = google_container_cluster.main.name
}

output "network_name" {
  value = google_compute_network.main.name
}

output "subnet_name" {
  value = google_compute_subnetwork.nodes.name
}
