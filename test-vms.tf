// Creating test VM 1
resource "google_compute_instance" "instance1" {
  project      = var.project_id
  name         = "hub-instance1"
  machine_type = "n2-standard-2"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork         = "vpc0-europe-west1"
    subnetwork_project = var.project_id
  }

  // Assigning secure tag "application-id:app01" to the instance
  params {
    resource_manager_tags = {
      "tagKeys/${google_tags_tag_key.app-id-key.name}" = "tagValues/${google_tags_tag_value.app01.name}"
    }
  }
}

// Creating test VM 2
resource "google_compute_instance" "instance2" {
  project      = var.project_id
  name         = "hub-instance2"
  machine_type = "n2-standard-2"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork         = "vpc0-europe-west1"
    subnetwork_project = var.project_id
  }

  // Assigning secure tag "application-id:app01" to the instance
  params {
    resource_manager_tags = {
      "tagKeys/${google_tags_tag_key.app-id-key.name}" = "tagValues/${google_tags_tag_value.app01.name}"
    }
  }
}