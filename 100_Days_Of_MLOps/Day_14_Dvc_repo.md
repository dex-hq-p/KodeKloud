###

```
A project exists at /root/code/fraud-detection/ with DVC initialised. The scripts are at src/data/process_data.py and src/data/split_data.py, and the raw input is at data/raw/transactions.csv. Do not modify the Python files or the input data.

Acceptance criteria:

A dvc.yaml defines two stages:
process_data – runs python3 src/data/process_data.py; depends on data/raw/transactions.csv and src/data/process_data.py; produces data/processed/clean_transactions.csv.
split_data – runs python3 src/data/split_data.py; depends on data/processed/clean_transactions.csv (the upstream stage's output, so DVC chains the stages) and src/data/split_data.py; produces data/processed/train.csv and data/processed/test.csv.
The pipeline has been reproduced so both stages execute in order and dvc.lock is written, and dvc status reports no stale stages.
```

```
stages:
  process_data:
    cmd: python3 src/data/process_data.py
    deps:
      - data/raw/transactions.csv
      - src/data/process_data.py
    outs:
      - data/processed/clean_transactions.csv

  split_data:
    cmd: python3 src/data/split_data.py
    deps:
      - data/processed/clean_transactions.csv
      - src/data/split_data.py
    outs:
      - data/processed/train.csv
      - data/processed/test.csv
```

```
dvc repro
dvc status

process_data
     ↓
clean_transactions.csv
     ↓
split_data
     ↓
train.csv + test.csv
```
