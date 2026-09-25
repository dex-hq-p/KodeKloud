resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name        = "nautilus-vol"
  }
}
resource "aws_ebs_snapshot" "nautilus_snapshot" {
  volume_id   = aws_ebs_volume.k8s_volume.id
  description = "Nautilus Snapshot"

  tags = {
    Name = "nautilus-vol-ss"
  }
}
kubectl run time-check --namespace=devops --image=busybox:latest --dry-run=client -o yaml --restart=Never --command -- sleep 3600 > time-check.yaml

