Perfect! Here's your **One-Page Cheat Sheet** for both **Kubernetes Practical + AZ-900 Core Concepts**, focused on **quick revision before interview**:

---

## 🧠 **Kubernetes Quick Practical Cheat Sheet (Beginner)**

### 🔹 **Minikube Setup** (or use [play-with-k8s.com](https://labs.play-with-k8s.com/))
```bash
minikube start
kubectl cluster-info
```

---

### 🔹 **Pod Deployment**
```bash
kubectl run nginx --image=nginx
kubectl get pods
kubectl delete pod nginx
```

---

### 🔹 **Deployment Creation**
```bash
kubectl create deployment myapp --image=nginx
kubectl get deployments
kubectl delete deployment myapp
```

---

### 🔹 **Expose Deployment as Service**
```bash
kubectl expose deployment myapp --type=NodePort --port=80
minikube service myapp --url
```

---

### 🔹 **Using YAML**
```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-deploy
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      labels:
        app: hello
    spec:
      containers:
      - name: hello
        image: nginx
        ports:
        - containerPort: 80
```
```bash
kubectl apply -f deployment.yaml
kubectl delete -f deployment.yaml
```

---

### 🎯 Interview Phrases to Use
- “I deployed and exposed apps using `kubectl` and YAML configs.”
- “I practiced rolling updates, node port services, and scaling deployments.”
- “Explored Minikube locally to understand pod lifecycle and service types.”

---

## ⚡ **AZ-900 Cheat Sheet (Concepts + Sample Q&A)**

### 🔹 **Blob Storage Tiers**
| Tier     | Use Case             | Retention      | Access Time |
|----------|----------------------|----------------|-------------|
| Hot      | Frequent data usage  | No min         | Instant     |
| Cool     | Monthly backups      | Min 30 days    | Fast        |
| Archive  | Rare access/archive  | Min 180 days   | Slow (hrs)  |

**Q:** *When to use Cool tier?*  
**A:** For infrequent data like monthly backups to save cost.

---

### 🔹 **CapEx vs OpEx**
| Type   | Description                              | Example              |
|--------|------------------------------------------|----------------------|
| CapEx  | One-time upfront cost                    | Buying servers       |
| OpEx   | Pay-as-you-go model                      | Azure VM hourly rate |

**Q:** *Why is OpEx better in cloud?*  
**A:** It reduces upfront investment and provides flexibility to scale.

---

### 🔹 **Availability Concepts**
| Term             | Meaning                                |
|------------------|----------------------------------------|
| HA (High Avail.) | Reduce downtime via redundancy         |
| Fault Tolerance  | System continues despite failures      |
| DR (Disaster Rec.)| Data/services recovery after failure  |

**Q:** *Is HA same as fault tolerance?*  
**A:** No, HA reduces downtime, FT ensures zero interruption.

---

### 🔹 **Important Azure Services**
| Service         | Role                              |
|-----------------|-----------------------------------|
| VM              | Virtual compute (IaaS)            |
| Blob Storage    | Object storage (tiers: Hot/Cool)  |
| VNet            | Secure networking                 |
| Resource Group  | Logical container for resources   |
| Azure Monitor   | Metrics, logs, alerts             |
| RBAC            | Access management (IAM)           |

---

### 🔹 **Sample Concept Questions**
- **Q:** What is a resource group?  
  **A:** Logical container for grouping related Azure resources.

- **Q:** What’s the benefit of Availability Zones?  
  **A:** Provide high availability by hosting across physical zones.

- **Q:** Define SLA.  
  **A:** Service Level Agreement — uptime guarantee for services.

---



Here are very beginner-friendly, fast-to-do practicals you can try on Minikube or Play with K8s (online):


Topic	Command/Concept	What to Say in Interview
Deploy a Pod	
kubectl run nginx --image=nginx	
“I deployed basic pods using kubectl for testing container behavior.”


Check Pod status	
kubectl get pods	
“Monitored pod lifecycle and states like Pending, Running, CrashLoopBackOff.”


Create Deployment	
kubectl create deployment myapp --image=nginx	
“Used deployments for managing rolling updates of applications.”


Expose Deployment
kubectl expose deployment myapp --type=NodePort --port=80	
“Exposed deployments to be reachable from outside the cluster.”


View Cluster Info	
kubectl cluster-info	
“Understood cluster-level details like control plane and services.”

---

YAML deployment file	Write a simple deployment.yaml and apply using kubectl apply -f deployment.yaml	
“I wrote basic deployment YAMLs to manage apps declaratively.”

🧠 Pro Tip: Just practice one app deployment (like NGINX), exposing it, and deleting it — that's enough to sound confident.

