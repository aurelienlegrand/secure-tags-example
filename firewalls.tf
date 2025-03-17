// Simple Firewall example
module "firewall-policy" {
  source    = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/net-firewall-policy"
  name      = "test-1"
  parent_id = var.project_id
  region    = "global"
  attachments = {
    "${module.vpc1.name}" = module.vpc1.self_link
  }
  egress_rules = {
    smtp = {
      priority = 900
      match = {
        destination_ranges = ["0.0.0.0/0"]
        layer4_configs     = [{ protocol = "tcp", ports = ["25"] }]
      }
    }
  }
  ingress_rules = {
    icmp = {
      priority = 1000
      match = {
        source_ranges  = ["0.0.0.0/0"]
        layer4_configs = [{ protocol = "icmp" }]
      }
    }
    app01_http = {
      priority       = 1001
      enable_logging = true
      target_tags = ["tagValues/${google_tags_tag_value.app01.name}"]
      match = {
        source_tags = ["tagValues/${google_tags_tag_value.app01.name}"]
        layer4_configs     = [{ protocol = "tcp", ports = ["80", "8080"] }]
      }
    }
  }
}