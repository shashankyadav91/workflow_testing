# IAM guidance

## Recommended service accounts

### 1. Workflows service account
Example:
- `wf-dataform-sa@YOUR_PROJECT_ID.iam.gserviceaccount.com`

Suggested roles:
- `roles/dataform.editor`
- `roles/iam.serviceAccountUser` on the service account used by Dataform
- `roles/logging.logWriter`

### 2. Scheduler service account
Example:
- `scheduler-sa@YOUR_PROJECT_ID.iam.gserviceaccount.com`

Suggested role:
- permission to invoke workflow executions

## Notes

Use separate service accounts per environment if you have dev/qa/prod isolation.
