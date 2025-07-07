# DevSecOps GitHub Actions Pipeline

This project demonstrates a full DevSecOps pipeline using GitHub Actions with:

- Snyk for:
  - Infrastructure as Code (IaC) scanning
  - Static Application Security Testing (SAST)
  - Software Composition Analysis (SCA)
- OWASP ZAP for Dynamic Application Security Testing (DAST)

## 🔧 Prerequisites

1. **Snyk Account**: Sign up at [https://snyk.io](https://snyk.io)
2. **SNYK_TOKEN**: Create a Snyk API token and add it as a GitHub Secret:
   - Go to your repo → Settings → Secrets → `SNYK_TOKEN`

3. **OWASP ZAP target URL**: Make sure your app is deployed and reachable for ZAP to scan.

## 🧪 How to Use

1. Clone this repo.
2. Update the `target` URL in `.github/workflows/devsecops.yml` with your app’s URL.
3. Push to the `main` branch or create a PR to trigger the workflow.

## 📂 Files

- `.github/workflows/devsecops.yml` – GitHub Actions workflow
