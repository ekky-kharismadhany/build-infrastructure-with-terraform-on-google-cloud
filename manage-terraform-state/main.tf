terraform {
  backend "gcs" {
    prefix = "terraform/state"
    bucket = "qwiklabs-gcp-02-f8a08f8e7401"
  }
}

provider "google" {
  project = "qwiklabs-gcp-02-f8a08f8e7401"
  region  = "us-central1"
}

resource "google_storage_bucket" "test-bucket-for-state" {
  name                        = "qwiklabs-gcp-02-f8a08f8e7401"
  location                    = "US"
  uniform_bucket_level_access = true
}