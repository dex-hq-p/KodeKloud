###

```
Task Details:
1) VM Details:

The VM is named xfusion-vm and is running in the eastus region. The default SSH user is azureuser — use this user to connect to the VM.
You need to add the root user's SSH public key from the Azure client host to the authorized_keys file of the VM's root user.
The SSH public key of the root user on the Azure client host is located at /root/.ssh/id_rsa.pub.
2) Public Key Addition:

Copy the public key located at /root/.ssh/id_rsa.pub on the Azure client host to the authorized_keys file of the root user on xfusion-vm.
Ensure that the proper permissions for the .ssh folder and authorized_keys file are set on the VM.
3) Verification:

After adding the public key, make sure that you are able to SSH into the xfusion-vm VM as the root user from the Azure client host without needing a password.
Important Notes:
Ensure that the VM is up and running before attempting to SSH.
You may need to adjust the firewall or security group rules for the VM to allow SSH access.
```

```
cat /root/.ssh/id_rsa.pub

2. Lấy IP của xfusion-vm
ssh azureuser@20.x.x.x
sudo mkdir -p /root/.ssh
sudo chmod 700 /root/.ssh
exit

cat /root/.ssh/id_rsa.pub | ssh azureuser@20.x.x.x \
  'sudo tee -a /root/.ssh/authorized_keys > /dev/null'


ssh root@20.x.x.x

```

