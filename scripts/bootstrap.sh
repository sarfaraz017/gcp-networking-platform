#!/bin/bash

PROJECT_ID=$1

gcloud config set project $PROJECT_ID

gcloud services enable compute.googleapis.com
gcloud services enable dns.googleapis.com

gsutil mb -l us-central1 gs://$PROJECT_ID-tf-state
