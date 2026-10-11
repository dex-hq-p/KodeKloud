###

```
The Nautilus DevOps team needs to set up an Amazon OpenSearch Service domain to store and search their application logs. The domain should have the following specification:

1) The domain name should be xfusion-es.

2) Use Terraform to create the OpenSearch domain. The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.
```

```
resource "aws_opensearch_domain" "xfusion_es" {
  domain_name    = "xfusion-es"
  engine_version = "Elasticsearch_7.10"

  cluster_config {
    instance_type = "t3.small.search"
  }

  tags = {
    Domain = "OpenSearch"
  }
}
```