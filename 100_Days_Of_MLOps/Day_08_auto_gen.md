```
The xFusionCorp Industries ML team promotes code quality for every commit by utilizing pre-commit. A draft .pre-commit-config.yaml file is located in the git repository at /root/code/fraud-detection/. However, this configuration does not align with the team's standards, resulting in a failure when executing pre-commit run --all-files. Revise the configuration to ensure compliance with the team's requirements.


A git repository already exists at /root/code/fraud-detection/ with .pre-commit-config.yaml and process.py already tracked. pre-commit is installed system-wide. From the project directory, run pre-commit run --all-files to see how the current configuration fails.

The end state must satisfy the following:

the configuration declares these five hooks so that pre-commit run --all-files executes every one of them:
trailing-whitespace, end-of-file-fixer, and check-yaml – All three sourced from the pre-commit/pre-commit-hooks repository, pinned to a current release;
ruff – Sourced from the astral-sh/ruff-pre-commit repository, pinned to a current release;
black – Sourced from the psf/black-pre-commit-mirror repository, pinned to a current release;
every repository entry in the configuration includes a rev: field;
the hooks are registered with git and run cleanly against the tracked files.
```



```
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v6.0.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml

  - repo: https://github.com/charliermarsh/ruff-pre-commit
    rev: v0.16.8
    hooks:
      - id: ruff

  - repo: https://github.com/psf/black-pre-commit-mirror
    rev: 26.5.1
    hooks:
      - id: black


pre-commit autoupdate
pre-commit run --all-files
```