###

```
The project at /root/code/fraud-detection/ contains a pyproject.toml and sample sources under src/. ruff and black are already installed. From the project directory, run ruff check src/ and black --check src/ to see how they currently fail.

The end state must satisfy the following:

ruff and black are both configured with a line length of 120.
ruff lint rule selection includes E, F, W, and I.
Running ruff check src/ from the project directory exits with status 0.
Running black --check src/ from the project directory exits with status 0.
```

```
[project]
name = "fraud-detection"
version = "0.1.0"

[tool.ruff.lint]
select = ["E", "F", "W", "I"]

[tool.ruff]
line-length = 120

[tool.black]
line-length = 120


root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  black --check src/
All done! ✨ 🍰 ✨
5 files would be left unchanged.

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  ruff check src/
All checks passed!

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  black --check src/
All done! ✨ 🍰 ✨
5 files would be left unchanged.

    2  ruff check src/
    3  black check src/
   13  black --check src/
```
