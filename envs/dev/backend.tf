terraform {
  backend "gcs" {
    bucket = "your-tf-state-bucket"
    prefix = "dev/networking"
  }
}
