output "kubernetes_clusters" {
  description = "An object containing the Kubernetes Clusters created by the module."
  value       = azurerm_kubernetes_cluster.this
}
