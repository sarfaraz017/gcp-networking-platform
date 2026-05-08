resource "google_dns_managed_zone" "private_zone" {
  name     = var.name
  dns_name = var.dns_name

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.network
    }
  }
}
