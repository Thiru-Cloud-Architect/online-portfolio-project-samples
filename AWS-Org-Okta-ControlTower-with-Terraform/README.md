# AWS Org + Okta IdP + Control Tower + Service Catalog

This Terraform-based project helps you bootstrap a full **enterprise-grade AWS organization**, including:

- ✅ AWS Organizations with OUs and SCPs
- ✅ Okta SAML integration via IAM Identity Center
- ✅ AWS Control Tower initialization
- ✅ Account vending setup via Service Catalog
- ✅ Sample SCPs and permission sets

## Folder Structure

```
terraform/
├── modules/
│   ├── organizations/       # Org, OU, SCP
│   ├── idp-okta/            # Okta SAML + IAM Identity Center
│   ├── control-tower/       # Guardrails, logging, notes
│   └── service-catalog/     # Account vending portfolio
└── environments/
    └── dev/                 # Wiring everything together
```

## Usage

1. Update `terraform/modules/idp-okta/okta-metadata.xml` with actual Okta metadata
2. Set account IDs, Okta group IDs in `idp-okta/main.tf`
3. Initialize and apply:

```bash
cd terraform/environments/dev
terraform init
terraform apply
```

## SCP Example Included

- Deny access to all regions except:
  - us-east-1
  - us-west-2
  - eu-central-1

## Notes

- Control Tower setup must be bootstrapped via Console once
- This project assumes you have enabled IAM Identity Center
- Use Okta Terraform provider for dynamic Okta group linking (optional)

## References

- [AWS SSO + Okta Docs](https://aws.amazon.com/blogs/security/how-to-connect-okta-to-aws-sso/)
- [Terraform AWS Org Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization)
