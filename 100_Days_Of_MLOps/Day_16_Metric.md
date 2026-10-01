###

```
After training a model, the xFusionCorp Industries ML team requires DVC to surface model metrics through dvc metrics show. Although the fraud-detection pipeline successfully trains a model and generates a metrics.json file, DVC currently does not recognize this file as a metric. Ensure that the metrics.json file is properly configured to be recognized by DVC.


A project exists at /root/code/fraud-detection/ with a three-stage DVC pipeline (process_data, split_data, train). The train stage runs src/models/train.py, which writes the model to models/model.pkl and metrics to metrics.json. Do not modify the Python files.

Acceptance criteria:

The train stage in dvc.yaml declares metrics.json as a DVC metric output rather than a regular file output, with cache: false so the JSON lives in Git for diff history rather than in the DVC cache.
The pipeline has been reproduced so the metric registration takes effect, and dvc metrics show reports the accuracy and f1_score values from metrics.json.
```