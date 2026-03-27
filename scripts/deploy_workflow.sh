#!/bin/bash

PROJECT_ID="YOUR_PROJECT_ID"
REGION="us-central1"
WORKFLOW_NAME="dataform-runner"
WORKFLOW_SA="wf-dataform-sa@${PROJECT_ID}.iam.gserviceaccount.com"

gcloud workflows deploy ${WORKFLOW_NAME} \
  --location=${REGION} \
  --source=workflows/dataform_runner.yaml \
  --service-account=${WORKFLOW_SA}
