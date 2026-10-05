####


```
A Blob container named nautilus-blob-155348940 already exists in the westus region under the storage account nautilusst155348940. Copy the file /tmp/nautilus.txt to the Blob container nautilus-blob-155348940.

az storage blob upload \
  --account-name nautilusst155348940 \
  --container-name nautilus-blob-155348940 \
  --name nautilus.txt \
  --file /tmp/nautilus.txt \
  --auth-mode login
```