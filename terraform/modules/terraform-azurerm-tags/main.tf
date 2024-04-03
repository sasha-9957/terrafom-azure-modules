locals {
  tags_params = {
    tags_params1 = {
      managed_by = var.tags_params.managed_by
      dept       = var.tags_params.dept
      owner      = var.tags_params.owner
      intent     = var.tags_params.intent
    }
  }
}
