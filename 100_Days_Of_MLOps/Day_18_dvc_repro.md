###

```
The xFusionCorp Industries MLOps team versions datasets and models on separate Git branches so it can reproduce and roll between versions cleanly. Tag the current state as v1.0, create a v2-improved branch built on a newer dataset (which retrains the model), and confirm that switching back restores the original data and model.


A project exists at /root/code/fraud-detection/ with a working DVC pipeline (it processes the data and trains a model) and the baseline data/raw/transactions.csv already tracked.

An improved dataset has been pre-staged at /root/code/fraud-detection/data/raw/transactions_v2.csv and is visible in the file explorer. Do not delete this file.

Acceptance criteria:

On the main branch, the current state is tagged v1.0.
A branch named v2-improved holds the v2 state: the tracked dataset carries the contents of the v2 file (re-tracked with DVC), the pipeline has been re-run so models/model.pkl is retrained and versioned alongside the dataset, and the changes are committed.
```