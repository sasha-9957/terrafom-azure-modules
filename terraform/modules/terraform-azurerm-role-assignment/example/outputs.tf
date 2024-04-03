output "role_assignments" {
  description = "An object containing the Azure Role Assignments created by the module."
  value       = module.role_assignment.role_assignments
}
