```
A Makefile lives in /root/code/fraud-detection/. Run make all from the project directory to see how it currently fails.

The end state must satisfy the following:

the Makefile declares these six targets and behaviour:
setup – Creates a virtual environment at mlops-venv/ and installs dependencies from requirements.txt;
data – Runs python3 src/data/process_data.py;
train – Runs python3 src/models/train.py;
test – Runs pytest tests/;
clean – Recursively removes every __pycache__ directory, removes .pytest_cache, and clears the contents of models/;
all – Runs setup, data, train, and test in that order;
all six target names are declared as .PHONY so that Make never confuses them with files of the same name;
make all completes without error.
Makefile recipes must be indented with a real tab character, not spaces. Make rejects any recipe that is not tab-indented.
```

```
# fraud-detection Makefile

.PHONY: setup data train test clean all

setup:
	python3 -m venv mlops-venv && mlops-venv/bin/pip install -r requirements.txt

data:
	python3 src/data/process_data.py

train:
	python3 src/models/train.py

test:
	pytest tests/

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache
	rm -rf models/*

all: setup data train test

```

```
Makefile yêu cầu recipe phải bắt đầu bằng TAB.
cat -A Makefile

clean:
	rm -rf __pycache__
→ chỉ xóa __pycache__ ở thư mục hiện tại, không recursive, thiếu .pytest_cache và models/*.
```




