# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  # Must be the fully qualified path to the identity provider: //iam.googleapis.com/projects/<PROJECT NUMBER>/locations/global/workloadIdentityPools/<POOL ID>/providers/<PROVIDER ID>
  audience = ["gcp.workload.identity"]
}

deployment "production" {
  inputs = {
    public_ssh_key_url         = var.public_ssh_key_url
    # identity_token_file        = identity_token.gcp.jwt_filename
    gcp_audience               = identity_token.gcp.audience
    #gcp_service_account_email  = "<Set to your GCP service account email>"
    gcp_project_id             = var.gcp_project_id
    gcp_region                 = "us-central1"
    gcp_zone                   = "us-central1-a"
  }
}
