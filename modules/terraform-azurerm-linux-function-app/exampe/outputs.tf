output "linux_function_apps" {
  description = "An object containing the Azure Linux Function apps created by the module."
  value       = module.linux_function_app.linux_function_apps
  sensitive   = true
}
