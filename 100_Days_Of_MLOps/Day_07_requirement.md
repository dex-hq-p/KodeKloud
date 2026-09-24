###
```
The project at /root/code/fraud-detection/ contains the module source under src/fraud_detection/ — a predict() function that flags a transaction as fraud when its amount (the first feature value) exceeds 100. The source is complete; you do not need to modify it. pytest and build are already installed. Use python3 rather than python.

The end state must satisfy the following:

Unit tests: tests/test_predict.py contains at least two tests that import predict from fraud_detection and assert on its output — one fraudulent row (amount > 100, expect 1) and one legitimate row (amount <= 100, expect 0); pytest run from the project directory passes.
Packaging configuration: the corrected pyproject.toml satisfies every one of the following:
a [build-system] section with requires = ["setuptools>=61.0", "wheel"] and build-backend = "setuptools.build_meta";
name is fraud_detection;
version is 0.1.0;
requires-python is >=3.10;
dependencies is ["scikit-learn", "pandas", "numpy"];
pytest can import the package from src/ — declare [tool.pytest.ini_options] with pythonpath = ["src"].
Built artifact: building the package produces a wheel named fraud_detection-0.1.0-*.whl under dist/
```


```
[build-system]
requires = ["setuptools>=61.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "fraud_detection"
version = "0.1.0"
description = "Fraud detection model for xFusionCorp Industries"
requires-python = ">=3.10"
dependencies = ["scikit-learn", "pandas", "numpy"]

[tool.pytest.ini_options]
pythonpath = ["src"]


    2  pytest
    3  python3 -m pip install build
    4  python3 -m build
```
