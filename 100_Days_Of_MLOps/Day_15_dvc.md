###

```
A project exists at /root/code/fraud-detection/ with a three-stage DVC pipeline (process_data, split_data, train) and a params.yaml declaring n_estimators: 100. src/models/train.py already reads n_estimators from params.yaml. Do not modify the Python files.

The train stage in dvc.yaml currently has no params: section, so DVC does not track n_estimators — changing it would not re-run the stage.
```