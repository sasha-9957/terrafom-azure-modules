output "kubernetes_clusters" {
  description = "An object containing the Key Vaults created by the module."
  value       = module.kubernetes_cluster.kubernetes_clusters
}
