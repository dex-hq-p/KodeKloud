###

```
A project exists at /root/code/fraud-detection/ with DVC already initialised. The dataset data/raw/transactions.csv is currently tracked by Git, and the team standard requires DVC to own it instead.

Acceptance criteria:

Git no longer tracks the dataset, but the file remains on disk.
The dataset is tracked by DVC instead: a .dvc pointer file exists and data/raw/.gitignore excludes the dataset itself.
The new .dvc pointer and .gitignore are recorded in a Git commit with the message Track transactions dataset with DVC.
```

```
    1  cd /root/code/fraud-detection/
    2  git status
    3  git ls-files data/
    6  git rm --cached data/raw/transactions.csv
    7  dvc add data/raw/transactions.csv
    8  git status
    9  git add data/raw/transactions.csv.dvc data/raw/.gitignore
   10  git status
   11  git commit -m "Track transactions dataset with DVC"
```