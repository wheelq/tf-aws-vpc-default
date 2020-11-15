locals {
  region = "eu-west-2"
}
provider aws {
  region = local.region
}

module vpc_default {
  source = "./vpc_default"
}
