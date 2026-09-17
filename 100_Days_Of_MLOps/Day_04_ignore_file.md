```
The Git repository is at /root/code/fraud-detection/. Standard Python / ML artifacts were committed before any .gitignore existed, so ignoring them is not enough — a .gitignore never untracks files Git already tracks.

The end state must satisfy the following:

a .gitignore at the repository root excludes the standard Python / ML artifacts:
Python bytecode caches — __pycache__/ and *.pyc;
virtual environments — venv/;
Jupyter checkpoints — .ipynb_checkpoints/;
trained model files — *.pkl;
local environment files — .env;
those artifacts are removed from Git's index (while remaining on disk) and the cleanup is committed;
the project sources remain tracked: everything under src/fraud_detection/, README.md, and requirements.txt.

touch .gitignore
git rm -r --cached .
```

