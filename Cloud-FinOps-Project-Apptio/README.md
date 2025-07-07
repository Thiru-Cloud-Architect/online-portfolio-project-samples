# AWS Lambda: Apptio Cloudability to Jira Integration

This AWS Lambda function automates the process of creating Jira tickets based on cost optimization recommendations from Apptio Cloudability.

## Features

- Calls Cloudability API to fetch recommendations
- Filters for only **right-size** and **decommission** suggestions
- Creates Jira Story tickets with summary and detailed descriptions

## Environment Variables

| Variable               | Description                                          |
|------------------------|------------------------------------------------------|
| `CLOUDABILITY_API_KEY` | Your Cloudability API Key                            |
| `JIRA_API_TOKEN`       | Jira Personal Access Token                           |
| `JIRA_USER`            | Your Jira login email                                |
| `JIRA_BASE_URL`        | Jira site URL (e.g. `https://yourorg.atlassian.net`) |
| `JIRA_PROJECT_KEY`     | Jira Project Key (e.g., `FINOPS`)                    |

## Deployment

1. Package the `lambda` folder into a ZIP file.
2. Create a new Lambda function in AWS Console.
3. Upload the ZIP file as the Lambda code.
4. Set the environment variables listed above.
5. Assign permissions for VPC access if needed (if private endpoints are used).

## Invocation

This function can be scheduled using:
- AWS EventBridge (CloudWatch Events)
- Lambda test events
- HTTP trigger via API Gateway (with IAM/Auth)

## Notes

- You must replace the placeholder Cloudability API endpoint with the real one.
- Jira project and user must have create issue permissions.
