###
> The work is done on the controlplane host under /root/code/.

> The end state must satisfy the following:

> a Python virtual environment named ml-env exists under /root/code/;
the environment has numpy, pandas, scikit-learn, and matplotlib installed;
> a requirements.txt capturing the installed packages is saved at /root/code/requirements.txt.

```
cd /root/code
python3 -m venv ml-env # Tạo virtual environment ml-env
source ml-env/bin/activate # Activate environment
pip install numpy pandas scikit-learn matplotlib 
pip freeze > /root/code/requirements.txt # Tạo requirements.txt pip freeze có thể ghi thêm các dependency mà 4 package trên cần.
```