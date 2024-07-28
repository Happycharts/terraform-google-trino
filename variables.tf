variable "project_id" {
  description = "The GCP project you want to enable APIs on"
}

variable "organization_id" {
  description = "The organization id for the associated services"
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
}

variable "project_name" {
  description = "The name of the project you want to create"
}

variable "gcp_credentials" {
  type = string
  sensitive = true
}

variable "network_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "cluster_name_suffix" {
  description = "A suffix to append to the default cluster name"
}

variable "cluster_autoscaling" {
  type = object({
    enabled             = bool
    autoscaling_profile = string
    min_cpu_cores       = number
    max_cpu_cores       = number
    min_memory_gb       = number
    max_memory_gb       = number
    gpu_resources = list(object({
      resource_type = string
      minimum       = number
      maximum       = number
    }))
    auto_repair  = bool
    auto_upgrade = bool
  })
  default = {
    enabled             = false
    autoscaling_profile = "BALANCED"
    max_cpu_cores       = 0
    min_cpu_cores       = 0
    max_memory_gb       = 0
    min_memory_gb       = 0
    gpu_resources       = []
    auto_repair         = true
    auto_upgrade        = true
  }
  description = "Cluster autoscaling configuration. See [more details](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#clusterautoscaling)"

}