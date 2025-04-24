# 🚀 Project 1: Full-Stack CRUD App on AWS (EC2 + RDS + Docker)

## 🧰 Tech Stack
- **Frontend**: React (bundled inside Docker image)
- **Backend**: Node.js + Express
- **Database**: MySQL (Amazon RDS)
- **Infrastructure**: AWS EC2, RDS, Docker

---

## 🔨 What I Did

### ✅ Step 1: Created a MySQL RDS Instance
- Engine: MySQL
- Public accessibility: Enabled
- Database name: `my_app_db`
- Opened port **3306** in the **RDS Security Group**

### ✅ Step 2: Launched EC2 Instance
- **OS**: Amazon Linux 2
- **Setup Docker**:
  ```bash
  sudo yum update -y
  sudo yum install docker -y
  sudo service docker start
  sudo usermod -a -G docker ec2-user
  ```
- Reconnect to your EC2 terminal after adding user to Docker group.

### ✅ Step 3: Pulled and Ran Full Stack App
- Image used: `philippaul/node-mysql-app:02`
- Ran the container with DB environment variables:
  ```bash
  sudo docker run --rm -p 80:3000 \
    -e DB_HOST="<rds-endpoint>" \
    -e DB_USER="admin" \
    -e DB_PASSWORD="<yourpassword>" \
    -d philippaul/node-mysql-app:02
  ```

### ✅ Step 4: Verified Container Logs
```bash
sudo docker logs <container_id>
```
- Verified:
  - App is running on http://localhost:3000
  - Connected to `my_app_db`
  - Table `contacts` created
  - Insertions and fetch operations successful

---

## 🌐 Access
- Access the app via: `http://<ec2-public-ip>`
- Test basic CRUD operations through UI

---

## 🔐 Security Notes
- **Port 22 (SSH)**: Open for EC2 access
- **Port 80 (HTTP)**: Open for app access
- During testing, used `0.0.0.0/0` (open to all) in SG rules
- ✅ **Safer alternative**: Restrict port 80 to your own IP only (e.g., `123.45.67.89/32`)
   OR Go to Your EC2 dashboard, and copy/paste instance's Security Group ID to inbound rules of RDS Security Group.

---


🖼️ Architecture Diagram

                 +----------------------+
                 |     User Browser     |
                 |  (Access via HTTP)   |
                 +----------+-----------+
                            |
                            v
         +------------------+-------------------+
         |           AWS EC2 Instance           |
         |    (Amazon Linux + Docker installed) |
         |  - Runs Docker container             |
         |  - App on port 3000 exposed on 80    |
         +------------------+-------------------+
                            |
                            v
         +--------------------------------------+
         |     Docker Container (Fullstack)     |
         | - Node.js Backend                    |
         | - React Frontend                     |
         +--------------------------------------+
                            |
                            v
         +--------------------------------------+
         |         Amazon RDS (MySQL)           |
         | - Database: my_app_db                |
         | - Table: contacts                    |
         +--------------------------------------+


## 🖼️ Screenshots 
- EC2 instance dashboard
- RDS config screen 
- Docker command in terminal
- App running in browser
- Logs showing DB connection
- App UI showing CRUD actions

---