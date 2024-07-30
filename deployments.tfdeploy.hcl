# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  audience = ["gcp.workload.identity"]
}

deployment "production" {
  inputs = {
    public_ssh_key_url         = "https://pastebin.com/raw/GdiSq4jN"
    identity_token_file        = identity_token.gcp.jwt_filename
    gcp_audience               = "gcp.workload.identity"
    gcp_service_account_email  = "tfc-service-account@stacks-testing-430918.iam.gserviceaccount.com"
    gcp_project_id             = "stacks-testing-430918"
    gcp_region                 = "us-central1"
    gcp_zone                   = "us-central1-a"
  }
}
