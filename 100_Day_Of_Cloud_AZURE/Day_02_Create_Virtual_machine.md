```
The requirements are:

1) Use the existing resource group.

2) The VM name must be nautilus-vm, it should be in centralus region.

3) Use the Ubuntu 24.04 LTS image for the VM.

4) The VM size must be Standard_B1s.

5) Attach a default Network Security Group (NSG) that allows inbound SSH (port 22).

6) Attach a 30 GB storage disk of type Standard HDD.

7) The rest of the configurations should remain as default.

After completing these steps, make sure you can SSH into the virtual machine.
```

```
az vm create --resource-group kml_rg_main-df4c6dbd7a8a40ee --name nautilus-vm --location westus --image Ubuntu2404 --size Standard_B1s --admin-username azureuser --generate-ssh-keys --os-disk-size-gb 30 --storage-sku Standard_LRS --nsg-rule SSH
```