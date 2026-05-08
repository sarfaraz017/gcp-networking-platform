resource "google_compute_subnetwork" "subnet" {
  name          = var.name
  region        = var.region
  network       = var.network
  ip_cidr_range = var.primary_cidr

  secondary_ip_range {
    range_name    = "pods-range"
    ip_cidr_range = var.pods_cidr
  }

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = var.services_cidr
  }

  private_ip_google_access = true
}
