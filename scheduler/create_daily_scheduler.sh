#!/bin/bash

PROJECT_ID="YOUR_PROJECT_ID"
REGION="us-central1"
WORKFLOW_NAME="dataform-runner"
SCHEDULER_JOB_NAME="sch-dataform-daily"
SCHEDULER_SA="scheduler-sa@${PROJECT_ID}.iam.gserviceaccount.com"

ARGUMENT='{"project_id":"YOUR_PROJECT_ID","region":"us-central1","repository_id":"YOUR_DATAFORM_REPO","git_commitish":"main","included_tags":["daily"],"poll_seconds":20,"max_attempts":30}'

gcloud scheduler jobs create http ${SCHEDULER_JOB_NAME} \
  --location=${REGION} \
  --schedule="0 6 * * *" \
  --uri="https://workflowexecutions.googleapis.com/v1/projects/${PROJECT_ID}/locations/${REGION}/workflows/${WORKFLOW_NAME}/executions" \
  --http-method=POST \
  --oauth-service-account-email=${SCHEDULER_SA} \
  --headers="Content-Type=application/json" \
  --message-body="{\"argument\":\"${ARGUMENT//"/\\\"}\"}"
