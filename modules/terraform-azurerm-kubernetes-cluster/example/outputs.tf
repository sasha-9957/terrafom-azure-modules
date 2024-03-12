output "kubernetes_clusters" {
  description = "An object containing the Kubernetes Clusters created by the module."
  value       = module.kubernetes_cluster.kubernetes_clusters
}
