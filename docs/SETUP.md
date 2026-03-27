# Setup from scratch

## Step 1: Create a new GitHub repository manually

Suggested name:
- `dataform-workflow-orchestrator`

Then clone it locally:

```bash
git clone https://github.com/<your-user>/dataform-workflow-orchestrator.git
cd dataform-workflow-orchestrator
```

## Step 2: Copy this template content into the repo

Copy all files from this starter package into your cloned repo.

## Step 3: Update placeholders

Search and replace:
- `YOUR_PROJECT_ID`
- `YOUR_DATAFORM_REPO`
- region if not `us-central1`

## Step 4: Commit and push

```bash
git add .
git commit -m "Initial Dataform Workflows orchestration template"
git push origin main
```

## Step 5: Deploy the workflow

Run:

```bash
bash scripts/deploy_workflow.sh
```

## Step 6: Test manually

```bash
bash scripts/test_workflow.sh
```

## Step 7: Create the scheduler job

```bash
bash scheduler/create_daily_scheduler.sh
```
