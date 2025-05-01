# 📦 Sample Utilization of Terraform

## ✅ Prerequisites

Ensure your local machine has the following installed:

1. **Terraform**
2. **AWS CLI**

---

## ⚙️ Creation Steps

### 1. Configure the `main.tf` file

If you want to pick an **Amazon Linux 2 AMI**, you can run the following command:

```bash
aws ec2 describe-images \
  --owners amazon \
  --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" \
  --query "Images[*].[ImageId,Name]" \
  --output text
```

### 2. Initialize Terraform

```bash
terraform init
```

---

## ☁️ Apply the Configuration to AWS

1. Run the following command to apply the configuration to your cloud provider:

```bash
terraform apply
```

2. You'll notice thet the **terrafrom.tfstate** file is created/updated.

## ☁️ Terminate Instance

1. Run the following command to terminate an instance:

```bash
terraform destroy
```
