resource "google_compute_router" "router" {
  name    = var.name
  network = var.network
  region  = var.region

  bgp {
    asn = 64514
  }
}

output "router_name" {
  value = google_compute_router.router.name
}
