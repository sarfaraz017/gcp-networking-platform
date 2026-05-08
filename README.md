# 🚀 GCP Networking Platform

Production-grade GCP networking infrastructure using Terraform and CI/CD.

This repository demonstrates how enterprise platform engineering teams design scalable, secure, reusable, and automated networking foundations on Google Cloud Platform.

---

# 📌 Features

✅ Custom VPC Architecture

✅ Shared VPC Model

✅ Modular Terraform Design

✅ Multi-Environment Setup (dev/stage/prod)

✅ Cloud NAT + Cloud Router

✅ Firewall Rules

✅ Internal DNS

✅ Remote Terraform State

✅ CI/CD using Cloud Build

✅ Validation & Security Checks

✅ Reusable Infrastructure Modules

---

# 🏗️ Architecture Overview

```text
                    Shared VPC Host Project
                               │
        ┌──────────────────────┼──────────────────────┐
        │                      │                      │
   Dev Environment       Stage Environment      Prod Environment
        │                      │                      │
    Private Subnets       Private Subnets       Private Subnets
        │                      │                      │
      Cloud NAT             Cloud NAT             Cloud NAT
```

---

# 📁 Repository Structure

```text
gcp-networking-platform/
│
├── modules/
│   ├── vpc/
│   ├── subnet/
│   ├── firewall/
│   ├── nat/
│   ├── router/
│   ├── peering/
│   └── dns/
│
├── envs/
│   ├── dev/
│   ├── stage/
│   └── prod/
│
├── global/
│   ├── shared-vpc.tf
│   └── iam.tf
│
├── ci-cd/
│   ├── cloudbuild.yaml
│   └── policy-check.yaml
│
├── scripts/
│   ├── bootstrap.sh
│   └── validate.sh
│
├── Makefile
└── README.md
```

---

# ⚙️ Prerequisites

Install the following tools before execution:

| Tool       | Purpose                |
| ---------- | ---------------------- |
| Terraform  | Infrastructure as Code |
| gcloud CLI | GCP Authentication     |
| Git        | Version Control        |
| tflint     | Terraform Linting      |

---

# 🔐 GCP Authentication

Login to Google Cloud:

```bash
gcloud auth login
```

Set your project:

```bash
gcloud config set project YOUR_PROJECT_ID
```

---

# 🚀 Execution Steps

---

## Step 1 — Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/gcp-networking-platform.git

cd gcp-networking-platform
```

---

## Step 2 — Enable Required APIs

```bash
gcloud services enable compute.googleapis.com

gcloud services enable dns.googleapis.com
```

---

## Step 3 — Create Terraform State Bucket

```bash
gsutil mb -l us-central1 gs://YOUR_TF_STATE_BUCKET
```

---

## Step 4 — Configure Backend

Update:

```text
envs/dev/backend.tf
```

Example:

```hcl
terraform {
  backend "gcs" {
    bucket = "YOUR_TF_STATE_BUCKET"
    prefix = "dev/networking"
  }
}
```

---

## Step 5 — Configure Variables

Update:

```text
envs/dev/terraform.tfvars
```

Example:

```hcl
project_id = "YOUR_PROJECT_ID"

region = "us-central1"
```

---

## Step 6 — Initialize Terraform

```bash
cd envs/dev

terraform init
```

---

## Step 7 — Validate Terraform

```bash
terraform validate
```

Optional linting:

```bash
tflint
```

---

## Step 8 — Review Execution Plan

```bash
terraform plan
```

This command shows:

* resources to create
* modifications
* dependencies
* networking changes

---

## Step 9 — Deploy Infrastructure

```bash
terraform apply
```

Approve when prompted:

```text
yes
```

---

# 🔎 Verification

Open Google Cloud Console and verify:

* VPC Network
* Subnets
* Firewall Rules
* Cloud Router
* Cloud NAT
* Routes
* DNS Zones

---

# 🔄 CI/CD Pipeline

CI/CD is implemented using Cloud Build.

Pipeline performs:

1. Terraform Init
2. Terraform Plan
3. Terraform Apply
4. Security Validation
5. Policy Checks

---

# 🛡️ Security Best Practices

✅ Private subnet architecture

✅ Cloud NAT for outbound internet access

✅ Remote Terraform state

✅ Principle of least privilege

✅ Modular infrastructure isolation

✅ Environment separation

---

# 👨‍💻 Author

## Sarfaraz
