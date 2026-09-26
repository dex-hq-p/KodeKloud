###

```
SeaweedFS is already running on the controlplane and the dataset has already been pushed to the dvc-storage bucket — open the SeaweedFS Filer button at the top of the lab and navigate to /buckets/dvc-storage/ to confirm the object is there.

S3 endpoint: http://localhost:8333
Credentials: weedadmin / weedadmin123
Run dvc pull to see it fail, then inspect .dvc/config against the endpoint and credentials above.

Acceptance criteria:

The s3 remote in .dvc/config reaches SeaweedFS with the access key (access_key_id) weedadmin and the secret key (secret_access_key) weedadmin123.
After the pull, data/raw/transactions.csv is present on disk and its content matches the hash recorded in the .dvc pointer.
```

```
dvc pull
```

