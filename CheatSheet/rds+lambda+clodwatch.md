
## ☁️ **AWS Deep-Dive Topics: RDS, Lambda, CloudWatch**

---

### 🔶 **1. AWS RDS**

**💡 Used For:** Managed relational databases like MySQL, PostgreSQL, etc.

#### 🔧 Practical Use:
> I created an RDS MySQL database to store user data for a backend app. I used Terraform to provision it, enabled automated backups, and set up a security group for safe access from EC2 only.

#### 🎯 Interview Questions:

1. **Q:** How is RDS different from hosting your own database on EC2?
   - **A:** RDS is managed — AWS handles backups, patching, scaling. EC2 is fully self-managed and more effort-heavy.

2. **Q:** How would you secure an RDS database?
   - **A:** 
     - Use VPC with private subnets
     - Attach security groups with limited IP access
     - Use IAM for temporary credentials (IAM DB authentication)
     - Enable encryption and automated backups

3. **Q:** How did you automate your RDS provisioning?
   - **A:** Using Terraform's `aws_db_instance` resource, I passed values using variables for engine, storage, credentials, etc.

---

### ⚙️ **RDS Terraform Sample**

```hcl
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "password"
  skip_final_snapshot  = true
}
```

---

### 🟣 **2. AWS Lambda**

**💡 Used For:** Running serverless functions (no need to manage servers)

#### 🔧 Practical Use:
> I created a Lambda function triggered by an S3 upload to auto-tag uploaded images based on file name and write data to DynamoDB.

#### 🎯 Interview Questions:

1. **Q:** How does Lambda scale?
   - **A:** Lambda automatically scales by creating a new instance per request, with concurrency limits (1000 by default).

2. **Q:** What are cold starts?
   - **A:** Delay in execution when a Lambda is invoked after inactivity. Can be reduced using provisioned concurrency.

3. **Q:** What is the practical limit of Lambda usage?
   - **A:** Short-lived tasks under 15 minutes, especially event-driven like S3, API Gateway, or DynamoDB stream triggers.

---

### ⚙️ **Lambda Terraform Sample (with inline code)**

```hcl
resource "aws_lambda_function" "example" {
  function_name = "my_lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  filename      = "lambda.zip"
}
```

---

### 🟢 **3. AWS CloudWatch**

**💡 Used For:** Logging, Monitoring, Alarms, Dashboards

#### 🔧 Practical Use:
> I used CloudWatch to monitor Lambda execution times and created alarms to alert on Slack when duration exceeded limits.

#### 🎯 Interview Questions:

1. **Q:** How does CloudWatch help in debugging Lambda?
   - **A:** Logs all output, errors, and events. You can trace invocations using `RequestId`.

2. **Q:** What metrics can you monitor with CloudWatch?
   - **A:** CPU, memory, disk, Lambda duration, errors, throttles, custom app logs, etc.

3. **Q:** Explain a use case where CloudWatch was critical.
   - **A:** In an automated data pipeline, I used CloudWatch to create an alarm that notifies us if EC2 CPU crosses 80%, auto-scaling kicks in using that.

---

### ⚙️ **CloudWatch Alarm Sample (Terraform)**

```hcl
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "high-cpu-usage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "Alarm when CPU exceeds 80%"
  dimensions = {
    InstanceId = "i-xxxxxx"
  }
}
```

---

Let me know when you're ready to jump into **Kubernetes practicals** — or want a cheat sheet & interview Qs for **Azure AZ-900 concepts** like hot/cold storage, SLA, regions/zones, etc.







