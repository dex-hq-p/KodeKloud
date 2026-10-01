###

```
Create an IAM policy named iampolicy_james in us-east-1 region using Terraform. It must allow read-only access to the EC2 console, i.e., this policy must allow users to view all instances, AMIs, and snapshots in the Amazon EC2 console.
```

```
Vì sao dùng ec2:Describe*?

EC2 console muốn xem instances, AMIs, snapshots... thì chủ yếu cần các API dạng Describe.

Ví dụ:

ec2:DescribeInstances    → xem EC2 instances
ec2:DescribeImages       → xem AMIs
ec2:DescribeSnapshots    → xem snapshots
ec2:DescribeVolumes      → xem EBS volumes

Dùng:

ec2:Describe*

thì bao phủ các quyền read/describe của EC2 mà console cần.

```