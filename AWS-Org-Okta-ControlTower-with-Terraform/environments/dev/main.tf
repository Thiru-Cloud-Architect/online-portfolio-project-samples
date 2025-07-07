module "organizations" {
  source = "../../modules/organizations"
}

module "idp_okta" {
  source = "../../modules/idp-okta"
}

module "control_tower" {
  source = "../../modules/control-tower"
}

module "service_catalog" {
  source = "../../modules/service-catalog"
}
