resource "google_compute_instance" "default" {
  project = "qwiklabs-gcp-00-128471eadb81"
  zone = "europe-west1-d"
  name = "terraform"

  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {
      
    }
  }
}