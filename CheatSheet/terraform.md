Perfect plan! Here's your **Terraform Cheat Sheet** followed by **AWS RDS, Lambda, and CloudWatch** interview prep — both **critical thinking-based questions** and **practical applications**.

---

## 🚀 **Terraform Cheat Sheet for Interviews & Hands-On**

### ✅ **Basic Setup**

```bash
# Download Terraform: https://www.terraform.io/downloads
# Initialize project
terraform init

# Check what will be created
terraform plan

# Apply changes (create resources)
terraform apply

# Destroy everything
terraform destroy
```

---

### 📁 **Basic File Structure**

```plaintext
main.tf        → main configuration
variables.tf   → all declared variables
outputs.tf     → define what to output (like public IP)
terraform.tfstate → state of infrastructure
terraform.lock.hcl → dependency lock file
```

---

### 🌐 **Provider Setup (AWS Example)**

```hcl
provider "aws" {
  region     = "us-west-1"
  access_key = "..."
  secret_key = "..."
}
```

---

### 🏗️ **Common Resources**

#### EC2 Instance
```hcl
resource "aws_instance" "web" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
  tags = {
    Name = "my-ec2"
  }
}
```

#### S3 Bucket
```hcl
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-123"
}
```

---

### ⚙️ **Variables**

**variables.tf**
```hcl
variable "instance_type" {
  default = "t2.micro"
}
```

**main.tf**
```hcl
instance_type = var.instance_type
```

---

### 📤 **Outputs**

```hcl
output "public_ip" {
  value = aws_instance.web.public_ip
}
```

---

### 🛠️ **State Management**

```bash
terraform state list          # Show tracked resources
terraform state show <res>    # Show a specific resource
terraform state rm <res>      # Remove resource from state
```

---
