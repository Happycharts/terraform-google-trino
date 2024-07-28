output "project_info_example" {
  value       = module.project-factory.project_id
  description = "The ID of the created project"
}

output "domain_example" {
  value       = module.project-factory.domain
  description = "The organization's domain"
}


output "kubernetes_endpoint" {
  sensitive = true
  value     = module.gke.endpoint
}

output "client_token" {
  value     = try(base64encode(data.google_client_config.default.access_token), null)
  sensitive = true
}

output "ca_certificate" {
  value = module.gke.ca_certificate
  sensitive = true
}

output "service_account" {
  description = "The default service account used for running nodes."
  value       = module.gke.service_account
}