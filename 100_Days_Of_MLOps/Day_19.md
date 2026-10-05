###

```
A project exists at /root/code/ml-pipeline/ with Git and DVC initialised. The params.yaml is in place and the .dvc/config is pre-configured to push to the SeaweedFS bucket dvc-storage at http://localhost:8333.

The ingest, validate, and preprocess stages are already declared in dvc.yaml, but one of them is misconfigured and prevents dvc repro from completing — run dvc repro to see it fail. The two scripts for the remaining stages are pre-staged at /root/code/ml-pipeline/scripts-staging/train.py and scripts-staging/evaluate.py, and belong in scripts/.

Acceptance criteria:

The misconfigured existing stage is corrected so dvc repro can complete.
Two further stages are declared in dvc.yaml:
train – Depends on the preprocessed dataset and scripts/train.py; reads n_estimators, max_depth, test_size, and random_seed from params.yaml; outputs models/model.pkl and data/processed/test_split.csv; declares metrics.json as a DVC metric with cache: false.
evaluate – Depends on models/model.pkl, data/processed/test_split.csv, and scripts/evaluate.py; outputs reports/evaluation.json declared with cache: false.
The full pipeline has been reproduced, the cache pushed to the SeaweedFS remote, and the current state tagged v1.0.
Every change is committed to Git so the release is fully captured.
```