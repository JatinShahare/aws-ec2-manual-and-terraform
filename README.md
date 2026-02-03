# EC2 Provisioning on AWS: Manual vs Terraform

## Project Overview
This project demonstrates two ways of provisioning an EC2 instance on AWS:

1. Manual provisioning using the AWS Management Console
2. Automated provisioning using Terraform (Infrastructure as Code)

The goal is to understand AWS core concepts and compare manual infrastructure creation with Terraform-based automation.

---

## AWS Concepts Used

### Region and Availability Zone
- Region: us-east-1 (N. Virginia)
- Availability Zone: Automatically selected within the region

Regions provide geographic isolation, while Availability Zones provide fault tolerance.

---

### VPC (Virtual Private Cloud)
- Default VPC is used
- Provides isolated networking for EC2 instances

---

### Security Group
Security Groups act as virtual firewalls.

Inbound rules:
- SSH (Port 22) allowed only from My IP

Outbound rules:
- Allow all traffic

This follows the principle of least privilege.

---

### EC2 (Elastic Compute Cloud)
- AMI: Ubuntu 24.04 LTS
- Instance type: t3.micro
- Authentication: SSH using key pair

---

## Part 1: Manual EC2 Provisioning

### Steps
1. Login to AWS Console
2. Navigate to EC2 and click Launch Instance
3. Configure the instance:
   - Name: manual-ec2
   - AMI: Ubuntu 24.04 LTS
   - Instance type: t3.micro
   - Key pair: manual-ec2-key
   - Network: Default VPC
   - Auto-assign Public IP: Enabled
4. Configure Security Group:
   - Allow SSH (22) from My IP
5. Launch the instance
6. SSH into the instance:
   ssh -i manual-ec2-key.pem ubuntu@<PUBLIC_IP>

### Screenshots
- screenshots/manual_ec2_instance.png
- screenshots/ssh_login.png

---

## Part 2: EC2 Provisioning Using Terraform

### Terraform Directory Structure
terraform/
- main.tf
- providers.tf
- variables.tf
- outputs.tf
- terraform.tfvars.example
- terraform.tfvars (ignored)
- terraform.tfstate (ignored)

---

### Terraform Workflow

Initialize Terraform:
terraform init

Format, validate, and plan:
terraform fmt
terraform validate
terraform plan

Apply configuration:
terraform apply -auto-approve

Terraform creates an EC2 instance named:
terraform-ec2

---

### Terraform Outputs
terraform output

Outputs include:
- EC2 Instance ID
- Public IP
- Public DNS

---

### SSH into Terraform EC2
ssh -i manual-ec2-key.pem ubuntu@$(terraform output -raw public_ip)

---

### Screenshots
- screenshots/terraform_apply.png
- screenshots/terraform_instance.png


---

## Manual vs Terraform Comparison

Manual provisioning:
- Time consuming
- Not repeatable
- No version control
- Difficult to scale

Terraform provisioning:
- Fast and automated
- Repeatable and consistent
- Version controlled
- Supports drift detection

---

## Cleanup Steps

To avoid AWS charges:

Destroy Terraform-managed resources:
terraform destroy -auto-approve


## Screenshots
- screenshots/terraform_instance_destroy.png

Manually terminate the manual EC2 instance from the AWS Console.

---

## Key Learnings
- Core AWS infrastructure concepts
- Secure SSH access using key pairs
- IAM best practices for CLI access
- Terraform lifecycle: init, plan, apply, destroy
- Importance of Terraform state and outputs

---

## Conclusion
Terraform provides a reliable, repeatable, and scalable way to manage infrastructure. Compared to manual provisioning, Infrastructure as Code is the preferred approach in real-world DevOps environments.

