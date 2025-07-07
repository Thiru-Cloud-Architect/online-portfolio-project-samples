import json
import requests
import os

CLOUDABILITY_API_KEY = os.environ['CLOUDABILITY_API_KEY']
JIRA_API_TOKEN = os.environ['JIRA_API_TOKEN']
JIRA_USER = os.environ['JIRA_USER']
JIRA_BASE_URL = os.environ['JIRA_BASE_URL']
JIRA_PROJECT_KEY = os.environ['JIRA_PROJECT_KEY']

def get_cloudability_recommendations():
    url = "https://api.cloudability.com/v3/recommendations"  # Replace with actual endpoint
    headers = {
        "Authorization": f"Bearer {CLOUDABILITY_API_KEY}",
        "Content-Type": "application/json"
    }
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return response.json()

def create_jira_ticket(summary, description):
    url = f"{JIRA_BASE_URL}/rest/api/3/issue"
    auth = (JIRA_USER, JIRA_API_TOKEN)
    payload = {
        "fields": {
            "project": {
                "key": JIRA_PROJECT_KEY
            },
            "summary": summary,
            "description": description,
            "issuetype": {
                "name": "Story"
            }
        }
    }
    response = requests.post(url, auth=auth, json=payload)
    response.raise_for_status()
    return response.json()

def lambda_handler(event, context):
    try:
        recommendations = get_cloudability_recommendations()
        for item in recommendations.get("recommendations", []):
            action = item.get("action", "").lower()
            if action not in ["rightsize", "decommission"]:
                continue  # Only process rightsize or decommission actions

            resource = item.get("resource_name", "Unknown Resource")
            savings = item.get("monthly_savings", "N/A")
            summary = f"{action.title()} Recommendation: {resource}"
            description = (
                f"*Action:* {action}\n"
                f"*Resource:* {resource}\n"
                f"*Estimated Monthly Savings:* ${savings}\n"
                f"*Details:* {json.dumps(item, indent=2)}"
            )
            create_jira_ticket(summary, description)

        return {
            "statusCode": 200,
            "body": json.dumps("Jira tickets created for actionable recommendations.")
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": str(e)
        }
