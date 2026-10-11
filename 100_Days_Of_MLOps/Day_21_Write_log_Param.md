###

```
Your objective is to complete the script by filling in the TODO blocks with the appropriate MLflow logging calls, ensuring that every aspect of the run is effectively captured by the MLflow tracking server.


The MLflow tracking server is already running on port 5000. The MLflow UI button at the top of the lab can be opened to view the dashboard; the Default experiment is present on first load.

The script at /root/code/log_experiment.py prepares a params dictionary, fits a trivial sklearn model, and computes a pair of evaluation scores (accuracy and f1) from that model's predictions. Three blocks marked # TODO inside the mlflow.start_run() context are the only edits required.

Once the TODOs are completed and the script has been run, the end state must include:

A new run in the Default experiment.
Every hyperparameter in the params dict (n_estimators=100, max_depth=5, random_state=42) recorded as a run parameter.
Both computed scores (accuracy, f1_score) recorded as run metrics.
The sklearn model captured as an MLflow model artefact on the run.
```