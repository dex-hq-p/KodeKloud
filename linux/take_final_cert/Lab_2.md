###

```
The system admins at Nautilus have developed scripts to automate routine tasks. Their objective is to deploy these scripts on all app servers within Stratos DC following a defined schedule. However, before the full deployment, they aim to conduct a test using a sample cron job.


Install the cronie package and start the crond service on all app servers.
Add the cron job */5 * * * * echo hello > /tmp/cron_text (ensure the cron expression matches exactly) for the root user.
```