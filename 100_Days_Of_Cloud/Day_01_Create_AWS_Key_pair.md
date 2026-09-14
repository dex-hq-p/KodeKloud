###
> For this task, create a key pair with the following requirements: Name of the key pair should be datacenter-kp. Key pair type must be rsa Use below given AWS Credentials: (You can run the showcreds command on aws-client host to retrieve these credentials) 
> Console URL https://781832234450.signin.aws.amazon.com/console?region=us-east-1 
> Username kk_labs_user_549061 
> Password 5@5dXMB1b!m^ 
> Notes: Create the resources only in us-east-1 region. To display or hide the terminal of the AWS client machine, you can use the expand toggle b

```
aws ec2 create-key-pair \
  --key-name datacenter-kp \
  --key-type rsa \
  --region us-east-1
```
