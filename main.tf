module "vpc1" {
  source     = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/net-vpc"
  project_id = var.project_id
  name       = "ncc-hybrid"
  subnets = [
    {
      ip_cidr_range = "10.0.0.0/24"
      name          = "vpc0-europe-west1"
      region        = "europe-west1"
    },
    {
      ip_cidr_range = "10.0.16.0/24"
      name          = "vpc0-europe-west2"
      region        = "europe-west2"
    }
  ]
}

module "nat0" {
  source         = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/net-cloudnat"
  project_id     = var.project_id
  region         = "europe-west1"
  name           = "nat0"
  router_network = module.vpc1.self_link
}