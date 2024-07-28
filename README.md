# terraform-gke-trino

This module handles the deployment of not only the low level compute needed to run a GKE instance, but also handles a large portion of the administrative tasks involved with provisioning Projects, Service Accounts, and VPCs.

The end result is a fully provisioned GKE cluster with Trino installed and ready to go, with autoscaling and a NodePort service for the Trino UI.

## Motivation

The goal of this module was to give us a way to quickly deploy a GKE cluster with Trino installed for our customers without having to worry about the administrative tasks involved with setting up IAM roles, VPCs, and so on.

## Usage

We probably will need to clean up the definitions a bit more,  but the usage is pretty straight forward:

```hcl
module "gke_trino" {
    source = "github.com/happycharts/terraform-gke-trino"
    project_id = var.project_id
    region = var.region
    zone = var.zone
    cluster_name = var.cluster_name
    network = var.network
}

