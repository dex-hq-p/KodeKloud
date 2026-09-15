###


```
# --- xFusionCorp team overrides (review before starting the server) ---
c.IdentityProvider.token = ''
c.ServerApp.disable_check_xsrf = True
c.ServerApp.root_dir = '/root/notebooks'
c.ServerApp.port = 8888
c.ServerApp.ip = '0.0.0.0'

jupyter lab \
  --config /root/code/jupyter_lab_config.py \
  --allow-root

```