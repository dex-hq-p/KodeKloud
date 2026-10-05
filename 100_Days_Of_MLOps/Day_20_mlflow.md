###

```
MLflow is pre-installed on the controlplane. Launch the tracking server in the background and choose the flags that satisfy every end-state requirement below.

The server listens on port 5000 and is reachable on all network interfaces, not only localhost.

The backend store is a SQLite database at /root/code/mlflow-backend/mlflow.db. Create any parent directory first — MLflow aborts at startup if the backend directory is missing.

The artifact root is /root/code/mlflow-artifacts/.

The MLflow UI button at the top of the lab routes through the lab proxy, which reaches the server with a non-localhost host header and a different origin. Launch the server so it accepts any host header and any origin; otherwise the button returns a 403 or CORS error.

The server process persists in the background so it survives terminal closure.

nohup mlflow server \
  --host 0.0.0.0 \
  --port 5000 \
  --backend-store-uri sqlite:////root/code/mlflow-backend/mlflow.db \
  --default-artifact-root /root/code/mlflow-artifacts/ \
  --allowed-hosts '*' \
  --cors-allowed-origins '*' \
  > /root/mlflow.log 2>&1 &
```