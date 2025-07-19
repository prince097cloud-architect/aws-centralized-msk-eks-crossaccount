terraform {
  backend "remote" {
    organization = "TFE-PROD-GRADE-INFRA"

    workspaces {
      name = "eks-msk-prod"
    }
  }
}
