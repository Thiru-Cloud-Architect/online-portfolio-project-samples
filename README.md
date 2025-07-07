# 🌐 Online Portfolio: Cloud Architecture & DevSecOps Project Samples

Welcome to this curated collection of real-world cloud infrastructure projects demonstrating my expertise in **AWS architecture**, **DevSecOps**, **FinOps**, and **multi-account governance**. This portfolio showcases production-grade solutions with reusable Infrastructure as Code (IaC), secure CI/CD pipelines, and automation patterns.

---

## 🧭 Summary

Experienced Cloud Architect with a focus on delivering scalable, secure, and cost-efficient cloud solutions using AWS, Terraform, GitHub Actions, and FinOps tooling. Specialized in building cloud-native platforms with enterprise-grade governance, security posture management, and end-to-end automation.

---

## ⚙️ Core Technologies & Skills

- **Cloud Platforms:** AWS (Organizations, Control Tower, SCPs, ECS, Lambda), Azure, GCP  
- **Security & Governance:** IAM, WAF, Security Hub, GuardDuty, AWS Config, WIZ, Prisma Cloud, Cloud Custodian  
- **DevOps & IaC:** Terraform, CloudFormation, GitHub Actions, Jenkins, Ansible, Scalr  
- **DevSecOps:** Snyk (SCA & IaC), OWASP ZAP (DAST), SonarQube  
- **FinOps & Observability:** Apptio Cloudability, Harness, AWS Billing, QuickSight, Power BI, X-Ray  

---

## 🚀 Project Highlights

> 📌 For complete code, see individual folders inside this repo.

---

### ✅ 1. Multi-Account AWS Governance at Scale

**Use Cases:**  
- Centralized control using AWS Organizations & Control Tower  
- Secure account vending using Service Catalog  
- Okta-based SSO and permission boundaries  
- SCP-based restriction policies (deny public S3, enforce encryption)

**Tools Used:**  
`AWS Organizations` · `Control Tower` · `Terraform` · `Okta` · `Cloud Custodian` · `SCPs`  

---

### ✅ 2. DevSecOps CI/CD Pipeline with GitHub Actions

**Use Cases:**  
- IaC security scanning with Snyk  
- Static code analysis with SonarQube  
- Dynamic testing with OWASP ZAP  
- Secure GitHub Actions workflows for reusable pipelines

**Tools Used:**  
`GitHub Actions` · `Snyk` · `OWASP ZAP` · `SonarQube` · `Python/Node.js` · `Terraform`

---

### ✅ 3. FinOps Automation with Cloudability, Harness, and QuickSight

**Use Cases:**  
- Automated cost insights and recommendations via API  
- Jira ticket creation or dashboard ingestion based on right-sizing/decommission logic  
- S3-to-QuickSight pipelines for cost visualization  

**Tools Used:**  
`Apptio Cloudability` · `Harness` · `Lambda` · `QuickSight` · `Python` · `Jira API`

---

### ✅ 4. Modular Terraform EKS Microservices Platform (placed as a separate repo in the root)

**Use Cases:**  
- VPC, IAM, EKS, RDS modules with Helm-based observability  
- GitHub Actions for Helm chart deployment  
- IRSA, Service Discovery, and secure ALB ingress setup  

**Tools Used:**  
`EKS` · `Helm` · `Terraform` · `GitHub Actions` · `Prometheus/Grafana` · `cert-manager`

---

## 📁 Repo Structure

```
.
├── terraform/              # VPC, IAM, EKS, RDS modules
├── helm-charts/           # Ingress, monitoring, cert-manager
├── k8s-manifests/         # App YAMLs (frontend/backend/db)
├── .github/workflows/     # GitHub Actions pipelines
└── README.md              # You're here!
```

---

## 🛠️ How to Use This Portfolio

1. Browse each project folder
2. Read the individual `README.md` or comments inside code
3. Fork, reuse, and extend into your own cloud projects
4. Contributions welcome (with attribution)

---

> ✨ This repository is built to help hiring teams, tech evaluators, and cloud builders assess production-ready thinking in real-world cloud engineering scenarios.
