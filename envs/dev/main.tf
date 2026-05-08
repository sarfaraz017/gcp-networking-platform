module "vpc" {
  source = "../../modules/vpc"
  name   = "dev-vpc"
}

module "subnet" {
  source        = "../../modules/subnet"
  name          = "dev-subnet"
  region        = var.region
  network       = module.vpc.vpc_id
  primary_cidr  = "10.10.0.0/24"
  pods_cidr     = "10.20.0.0/24"
  services_cidr = "10.30.0.0/24"
}

module "router" {
  source  = "../../modules/router"
  name    = "dev-router"
  network = module.vpc.vpc_id
  region  = var.region
}

module "nat" {
  source  = "../../modules/nat"
  name    = "dev-nat"
  router  = module.router.router_name
  region  = var.region
}
