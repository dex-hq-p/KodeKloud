###

```
The xFusionCorp Industries MLOps team needs every model training run to be reproducible, automatically tracked, and easy to compare so a chosen configuration can be promoted into version control. The fraud-detection pipeline is parameterized by max_depth, currently set shallow enough to underfit. Using DVC experiments, run three tracked experiments over different max_depth values, compare their recorded f1_score on the held-out test set, and promote the best-scoring run so its parameters, metrics, and model become the tracked workspace state.


A project exists at /root/code/fraud-detection/ with a parameterised DVC pipeline already in place. params.yaml declares n_estimators: 100 and max_depth: 4, and the baseline pipeline has been run once. src/models/train.py reads both parameters, trains the model, and evaluates it on the held-out test set, writing the real accuracy and f1_score to metrics.json. Do not modify the Python files.

Acceptance criteria:

Three DVC experiments have been run, each with a different value for max_depth across a reasonable range (for example 2, 6, and 12); each experiment retrains the model and produces a fresh metrics.json.
The experiment with the highest f1_score is applied to the workspace, so its max_depth, metrics.json, and models/model.pkl become the tracked state
```


```
dvc exp run -S max_depth=2 -n exp-depth-2
dvc exp run -S max_depth=6 -n exp-depth-6


```

