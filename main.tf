resource "google_compute_instance" "default" {
  name         = "tftggatst"
  machine_type = "e2-micro"
  zone         = "us-west1-a"
  project = "tftggatst"

  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"  
    }
  }

  labels = {
    environment                = "test"
  }

  network_interface {
    network = "default"

    //access_config {
      // Ephemeral public IP
    //}
  }
  
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "86695684609-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}