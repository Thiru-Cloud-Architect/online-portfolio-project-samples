resource "aws_organizations_policy" "deny_root_access" {
  name = "DenyRootUser"
  description = "Disallow root user usage in child accounts"
  content = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "DenyRootActions",
        "Effect": "Deny",
        "Action": "*",
        "Resource": "*",
        "Condition": {
          "StringLike": {
            "aws:PrincipalArn": [
              "arn:aws:iam::*:root"
            ]
          }
        }
      }
    ]
  })
  type = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy" "tag_enforcement" {
  name = "RequireTags"
  description = "Ensure specific tags are attached to all resources"
  content = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "RequireTags",
        "Effect": "Deny",
        "Action": "*",
        "Resource": "*",
        "Condition": {
          "Null": {
            "aws:RequestTag/Environment": "true"
          }
        }
      }
    ]
  })
  type = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "attach_root_policy" {
  policy_id = aws_organizations_policy.deny_root_access.id
  target_id = data.aws_organizations_organization.main.roots[0].id
}

resource "aws_organizations_policy_attachment" "attach_tag_policy" {
  policy_id = aws_organizations_policy.tag_enforcement.id
  target_id = data.aws_organizations_organization.main.roots[0].id
}

data "aws_organizations_organization" "main" {}
