import json
import requests
import os
import boto3
from datetime import datetime

HARNESS_API_KEY = os.environ['HARNESS_API_KEY']
HARNESS_ACCOUNT_ID = os.environ['HARNESS_ACCOUNT_ID']
S3_BUCKET = os.environ['S3_BUCKET']
S3_KEY_PREFIX = os.environ.get('S3_KEY_PREFIX', 'harness-finops/')

s3 = boto3.client('s3')

def get_harness_recommendations():
    url = f"https://app.harness.io/gateway/cf/api/v2/accounts/{HARNESS_ACCOUNT_ID}/recommendations"
    headers = {
        "x-api-key": HARNESS_API_KEY,
        "Content-Type": "application/json"
    }
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return response.json()

def upload_to_s3(data):
    now = datetime.utcnow().strftime('%Y-%m-%d-%H-%M-%S')
    key = f"{S3_KEY_PREFIX}recommendations-{now}.json"
    s3.put_object(Bucket=S3_BUCKET, Key=key, Body=json.dumps(data))
    return key

def lambda_handler(event, context):
    try:
        recommendations = get_harness_recommendations()
        key = upload_to_s3(recommendations)
        return {
            "statusCode": 200,
            "body": json.dumps({"message": "Recommendations uploaded to S3", "s3_key": key})
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": str(e)
        }
