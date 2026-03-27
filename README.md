# workflow_testing
This is to test workflow in google
# Dataform Workflow Orchestration Template

This repository is a starter template for:

Cloud Scheduler -> Google Workflows -> Dataform -> BigQuery

It helps you orchestrate Dataform runs using a reusable Google Workflows template.

## Repository structure

- `workflows/dataform_runner.yaml` - main reusable Google Workflows template
- `scheduler/` - sample Cloud Scheduler payloads
- `scripts/` - sample gcloud deployment scripts
- `docs/` - setup guide, IAM, and architecture notes
- `examples/` - sample runtime inputs for different schedules/tags

## Typical flow

1. Cloud Scheduler triggers Workflows on a cron schedule.
2. Workflows creates a Dataform compilation result from the requested branch.
3. Workflows creates a Dataform workflow invocation.
4. Workflows polls until the invocation completes.
5. On success, it returns the invocation details.
6. On failure/cancel/timeout, it raises an error.

## Before you start

Enable these APIs:

- Dataform API
- Workflows API
- Cloud Scheduler API
- BigQuery API
- Cloud Resource Manager API
- IAM API

## Quick start

### 1) Update variables in scripts
Replace the placeholder values in `scripts/` with your project details.

### 2) Deploy the workflow
```bash
gcloud workflows deploy dataform-runner \
  --location=us-central1 \
  --source=workflows/dataform_runner.yaml \
  --service-account=wf-dataform-sa@YOUR_PROJECT_ID.iam.gserviceaccount.com
```

### 3) Test manually
```bash
gcloud workflows run dataform-runner \
  --location=us-central1 \
  --data=@examples/daily.json
```

### 4) Create scheduler job
Use one of the examples in `scheduler/` after replacing placeholders.

## Notes

- This template uses the Dataform API sequence: create compilation result, then create workflow invocation.
- You can reuse the same workflow for hourly/daily/weekly jobs by passing different tags in the runtime input.
- Keep Cloud Scheduler simple; orchestration logic belongs in Workflows.

