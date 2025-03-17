// Creating tag key in the network project
resource "google_tags_tag_key" "app-id-key" {
  parent = "projects/${var.project_id}"
  short_name = "application-id"
  description = "Identify applications by their unique ID"
  // Tag to be used for Firewalls
  purpose = "GCE_FIREWALL"
  // Binding the tag key to a GCP network
  purpose_data = {
    network = "${var.project_id}/${module.vpc1.name}"
  }
}

// Creating tag value for the app-id tag key
resource "google_tags_tag_value" "app01" {
    parent = "tagKeys/${google_tags_tag_key.app-id-key.name}"
    short_name = "app-01"
    description = "Application O1 ID"
}

// Creating tag value for the app-id tag key
resource "google_tags_tag_value" "app02" {
    parent = "tagKeys/${google_tags_tag_key.app-id-key.name}"
    short_name = "app-02"
    description = "Application O2 ID"
}

// Controls who can assign "app1" tag values to their VMs
resource "google_tags_tag_value_iam_binding" "binding" {
  tag_value = google_tags_tag_value.app01.name
  role = "roles/resourcemanager.tagUser"
  members = [
    "${var.tag_users}",
  ]
}