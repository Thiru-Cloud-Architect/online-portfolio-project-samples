# Harness FinOps Recommendations → AWS QuickSight (Python)

This project automates the process of:
1. Fetching **Harness cost optimization recommendations**
2. Uploading them to **Amazon S3** via a **Python Lambda**
3. Using **AWS QuickSight** to visualize the data as dashboards

## Project Structure

```
harness-finops-quicksight-python/
├── lambda/                # Lambda function (Python)
│   └── lambda_function.py
├── terraform/             # Terraform code for Lambda, S3, IAM
│   └── main.tf
└── README.md              # Full documentation
```

## Step-by-Step Setup

### Prerequisites

- Harness API key
- Terraform installed (`>=1.3`)
- AWS CLI configured with appropriate permissions
- QuickSight Enterprise enabled and SPICE dataset support

### 1. Deploy Infrastructure (S3 + Lambda)

Update values in `terraform/main.tf` and run:

```bash
cd terraform
terraform init
terraform apply
```

This sets up:
- S3 bucket to store JSON files
- Python Lambda to fetch Harness recommendations
- IAM roles and policies

### 2. Trigger Lambda

Trigger Lambda:
- Manually from console
- Or using EventBridge schedule (add if needed)

Lambda will upload JSON like:
```
s3://harness-finops-data-bucket/harness-finops/recommendations-YYYY-MM-DD.json
```

### 3. Setup QuickSight Dashboard

1. Go to **QuickSight → Manage Data → New Dataset**
2. Choose **S3** as source
3. Provide bucket and prefix (`harness-finops/`)
4. Choose JSON file format
5. Load dataset and build visuals on:
   - `resource_name`
   - `monthly_savings`
   - `recommendation_type`

### Test It Locally

```bash
python lambda/lambda_function.py
```

### IAM Role Required

Ensure Lambda has:

```json
{
  "Effect": "Allow",
  "Action": "s3:PutObject",
  "Resource": "arn:aws:s3:::harness-finops-data-bucket/*"
}
```

## Notes

- QuickSight can refresh dataset on schedule - AWS has great documentations on how to use this
- You can enhance this with Athena queries and FinOps KPIs
- Optionally you can leverage Athena + PowerBI for enterprise grade dashboarding for FinOps Recommendations - https://aws.amazon.com/blogs/big-data/creating-dashboards-quickly-on-microsoft-power-bi-using-amazon-athena/ 