data "aws_ssoadmin_instances" "main" {}

resource "aws_iam_saml_provider" "okta" {
  name                   = "OktaSSOProvider"
  saml_metadata_document = file("${path.module}/okta-metadata.xml")
}

resource "aws_ssoadmin_permission_set" "admin_access" {
  name             = "AdminAccess"
  description      = "Administrator access"
  instance_arn     = data.aws_ssoadmin_instances.main.arn
  session_duration = "PT8H"
}

resource "aws_ssoadmin_account_assignment" "admin_assignment" {
  instance_arn       = data.aws_ssoadmin_instances.main.arn
  permission_set_arn = aws_ssoadmin_permission_set.admin_access.arn
  principal_id       = "okta-group-id-placeholder"
  principal_type     = "GROUP"
  target_id          = "account-id-placeholder"
  target_type        = "AWS_ACCOUNT"
}
