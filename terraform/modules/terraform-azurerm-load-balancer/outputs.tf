output "load_balancers" {
  description = "An object containing the Azure Load Balancers created by the module."
  value       = azurerm_lb.this
}
