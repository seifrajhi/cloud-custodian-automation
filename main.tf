terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "eu-west-1"  
}

module "cloud_custodian_infra" {
  source = "./cloud_custodian-module"
  sqs_name                   = "sre-cloudCustodian"
  deploy_sqs                 = true
  dead_letter_sqs_name       = "sre-dead-letter-cloudCustodian"
  lambda_execution_role_name = "cloud-custodian-lambda"
  cloud_custodian_log_group  = "/lambda/cloud-custodian-poc"
  cloud_custodian_s3_bucket  = "cloudcustodian-poc-c7n"

}
