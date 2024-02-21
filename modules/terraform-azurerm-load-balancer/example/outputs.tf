output "load_balancers" {
  description = "An object map for input parameters of the Load Balancer module."
  value       = module.load_balancer.load_balancers
}
