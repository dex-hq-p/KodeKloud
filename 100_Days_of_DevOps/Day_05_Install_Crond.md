###
```
a. Install cronie package on all Nautilus app servers and start crond service.
b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.
```

```
sudo dnf install -y cronie
sudo systemctl enable --now crond
echo '*/5 * * * * echo hello > /tmp/cron_text' | sudo crontab -
sudo crontab -l

```