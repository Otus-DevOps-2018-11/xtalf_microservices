provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "terraform-docker-host-${count.index + 1}"
  count = 3
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  
  boot_disk {
    initialize_params {
      image = "docker-base"
      image = "${var.disk_image}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file("${var.public_key_path}")}"
  }

  tags = ["reddit-app"]


  network_interface {
    network = "default"
    access_config {}
  }

  connection {
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file("${var.private_key_path}")}"
  }


}
resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}