###

```
az group list --query "[].name" -o table

az vm create \
  --resource-group kml_rg_main-54813e6bc2d74ec4 \
  --name xfusion-vm \
  --image Ubuntu2204 \
  --size Standard_B2s \
  --admin-username azureuser \
  --generate-ssh-keys \
  --os-disk-size-gb 30 \
  --storage-sku Standard_LRS
```