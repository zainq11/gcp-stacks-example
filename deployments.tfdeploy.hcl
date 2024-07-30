# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  audience = ["//iam.googleapis.com/projects/275966277234/locations/global/workloadIdentityPools/my-tfc-pool/providers/my-tfc-provider-id"]
}

deployment "production" {
  inputs = {
    public_ssh_key_url         = "https://pastebin.com/raw/GdiSq4jN"
    identity_token_file        = identity_token.gcp.jwt_filename
    gcp_audience               = "//iam.googleapis.com/projects/275966277234/locations/global/workloadIdentityPools/my-tfc-pool/providers/my-tfc-provider-id"
    gcp_service_account_email  = "tfc-service-account@stacks-testing-430918.iam.gserviceaccount.com"
    gcp_project_id             = "stacks-testing-430918"
    gcp_region                 = "us-central1"
    gcp_zone                   = "us-central1-a"
  }
}
