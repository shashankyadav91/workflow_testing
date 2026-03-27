#!/bin/bash

REGION="us-central1"
WORKFLOW_NAME="dataform-runner"

gcloud workflows run ${WORKFLOW_NAME} \
  --location=${REGION} \
  --data=@examples/daily.json
