###

```
The Nautilus DevOps team needs to set up a new EC2 instance that can be accessed securely from their landing host (aws-client). The instance should be of type t2.micro and named datacenter-ec2. A new SSH key with name id_rsa should be created on the aws-client host under the/root/.ssh/ folder, if it doesn't already exist. This key should then be added to the root user's authorised keys on the EC2 instance, allowing passwordless SSH access from the aws-client host.

ssh-keygen -t rsa -b 2048 -f /root/.ssh/id_rsa -N ""

aws-client ~ ➜  cat .ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1MKqcXHMCKEKgdC/Kaq2wmQKdfxrFasGvfqitZb0ee+iLgN26W1G1hiF+Iqc9tkW5FFfhlNl4fTnIrdXZ/2gV+bfDw1qowwyuWRK2Gwp+RBDZUYWk4tV0zRu9DA+QGV7+Q/R7GwqPUooqneeuH+4HVAft6cqzpAv1fL+WPf6cbsWEh7GhlP4Z0ylY6g4xDmvItUKGzv++5px4M0kFxh1Xh7R+L/haK0poBQ33vzIsDi7Eck6M0if/h/iayMuczUCSNBEUg+vGD9/A2HwHcM+a8PqQU47HykOHQTiyqWd6kQ6j9v+jr68+hHeuZEn3ZCo4JhJLQVxSYV/hOLLJj4Zx root@aws-client


sudo mkdir -p /root/.ssh
sudo cp ~/.ssh/authorized_keys /root/.ssh/authorized_keys
sudo chown -R root:root /root/.ssh
sudo chmod 700 /root/.ssh
sudo chmod 600 /root/.ssh/authorized_keys
```