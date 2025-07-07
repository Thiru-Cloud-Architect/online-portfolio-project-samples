# Cloud Custodian: Sample Policies for AWS Security & Governance

This repository contains **sample Cloud Custodian policies** that help enforce common AWS security and governance rules.

## Included Policies

| File                          | Use Case                                           |
|-------------------------------|----------------------------------------------------|
| `s3-public-block.yml`         | Prevent public access to S3 buckets                |
| `iam-admin-role-detect.yml`   | Detect IAM roles with wildcard `*` permissions     |
| `ec2-open-security-group.yml` | Identify EC2 security groups open to the world     |
| `unused-iam-roles.yml`        | Find IAM roles unused in the last 60 days          |
| `rds-unencrypted.yml`         | Detect unencrypted RDS instances                   |

## Getting Started

### 1. Prerequisites

- Install [Cloud Custodian](https://cloudcustodian.io/)
```bash
pip install c7n
```

- Install AWS CLI and configure credentials
```bash
aws configure
```

### 2. Run a Policy

```bash
custodian run -s output policies/s3-public-block.yml
```

- `-s output` specifies the directory to store logs and results
- Review the `resources.json` file in the output directory for matched resources

### 3. Output

Cloud Custodian outputs:
- `resources.json`: matched resources
- `custodian-run.log`: execution log
- `metrics.json`: policy run metrics

### 4. Validate a Policy

```bash
custodian validate policies/s3-public-block.yml
```

## Notes

- You can schedule Custodian with **CloudWatch Events**, **Lambda**, or run it via **CI/CD pipelines**
- Tags, remediation actions, and multi-account support can be added as needed

## Reference

- [Cloud Custodian Docs](https://cloudcustodian.io/docs/)
- [GitHub Repository](https://github.com/cloud-custodian/cloud-custodian)

---
