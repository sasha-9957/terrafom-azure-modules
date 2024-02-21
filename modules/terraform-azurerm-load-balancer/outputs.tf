output "load_balancers" {
  description = "An object containing the load balancer data created by the module."
  value       = azurerm_lb.this
}
