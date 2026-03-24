# 🚀 Monitoring & Observability Platform (VM-Based)

![Platform](https://img.shields.io/badge/Platform-VM--Based-blue)
![Observability](https://img.shields.io/badge/Stack-Prometheus%20%7C%20Grafana%20%7C%20Loki-orange)
![Agent](https://img.shields.io/badge/Agent-Grafana%20Alloy-green)
![App](https://img.shields.io/badge/App-Python%20Flask-lightgrey)
![Infra](https://img.shields.io/badge/Infra-AWS%20EC2-232F3E)
![Alerting](https://img.shields.io/badge/Alerting-Slack-blueviolet)

---

## 📌 Project Overview

This project demonstrates a **production-style observability platform** deployed on AWS EC2 instances without using containers.

It implements **metrics, logs, visualization, and alerting** for a Python Flask application using modern tooling.

---

## 🏗️ Architecture

### 📊 Observability Flow

![Architecture](architecture/monitoring-architecture.png)

### 🌐 Network & Ports

![Ports](architecture/port-numbers.png)

---

## ⚙️ Tech Stack

| Layer         | Tool          |
| ------------- | ------------- |
| Metrics       | Prometheus    |
| Logs          | Loki          |
| Visualization | Grafana       |
| Agent         | Grafana Alloy |
| App           | Python Flask  |
| Infra         | AWS EC2       |
| Alerting      | Slack         |

---

## 🖥️ Infrastructure

Deployed on **AWS (us-east-1)** using **t3.micro EC2 instances**:

| Instance   | Role                              |
| ---------- | --------------------------------- |
| Web Server | Flask app + Alloy + Node Exporter |
| Prometheus | Metrics storage                   |
| Grafana    | Dashboards                        |
| Loki       | Log aggregation                   |

---

## 🔁 Data Flow

### Metrics

* Node Exporter → system metrics
* Flask app → `/metrics`
* Alloy → remote_write → Prometheus

### Logs

* App logs → `/var/log/titan/*.log`
* Alloy → Loki → Grafana

---

## 🏗️ Infrastructure as Code (Terraform)

Provision infrastructure using Terraform:

```bash
cd infra/terraform
terraform init
terraform apply
```

Creates:

* EC2 instances
* Security groups
* Networking

---

## ⚙️ CI/CD (GitHub Actions)

Pipeline:

* Terraform init
* Validate
* Plan

Location:

```
.github/workflows/terraform.yml
```

---

## 🚀 Deployment Steps

### 1. Provision Infrastructure

```bash
terraform apply
```

### 2. Setup Servers

Run on respective EC2 instances:

```bash
scripts/webnode-setup.sh
observability/prometheus/prometheus-setup.sh
observability/grafana/grafana-setup.sh
observability/loki/loki-setup.sh
```

---

### 3. Configure Alloy

Edit:

```
/etc/alloy/config.alloy
```

Update:

* Prometheus IP
* Loki IP

---

### 4. Access Services

| Service    | URL                         |
| ---------- | --------------------------- |
| Grafana    | http://<grafana-ip>:3000    |
| Prometheus | http://<prometheus-ip>:9090 |
| App        | http://<web-ip>:5000        |

---

## 📊 Dashboards
App-Dashboard
![App Dashboard](screenshots/grafana-dashboard-app.png)
System-Dashboard
![System Dashboard](screenshots/grafana-dashboard-system.png)
Alloy-Dashboard
![Alloy_Dashboard](screenshots/alloy-dashboard.png)
Prometheus-Targets
![Prometheus-Targets](screenshots/prometheus-targets.png)

---

## 🚨 Alerting

* Prometheus Alertmanager
* Slack integration

Triggers:

* High CPU
* App downtime
* Memory spikes
* Disk Usage
  
![Slack Alerts](screenshots/slack-alerts.png)

---

## 🧪 Load Testing

```bash
scripts/load.sh
scripts/generate_multi_logs.sh
```

---

## 📂 Project Structure

```bash
monitoring-and-observability/
│
├── architecture/
│   ├── monitoring-architecture.png
│   └── port-numbers.png
│
├── app/
│   └── titan/
│       ├── app.py
│       ├── requirements.txt          
│       ├── index.html
│       ├── payment.html
│       ├── images/
│       ├── tooplate-titan-script.js
│       ├── tooplate-titan-style.css
│       └── ABOUT THIS TEMPLATE.txt
│
├── observability/
│   ├── alloy/
│   │   ├── config.alloy              
│   │   └── defaults.env             
│   │
│   ├── prometheus/
│   │   ├── alert-rules.yml
│   │   ├── prometheus.yml
│   │   └── prometheus-setup.sh
│   │
│   ├── grafana/
│   │   └── grafana-setup.sh
│   │
│   └── loki/
│       └── loki-setup.sh           
│   
├── scripts/
│   ├── webnode-setup.sh              
│   ├── load.sh
│   ├── generate_multi_logs.sh
│   ├── website-test-main.sh          
│   └── website-test-payment.sh       
│
├── infra/
│   └── terraform/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── provider.tf
│       └── terraform.tfvars
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── docs/
│   ├── setup-guide.md
│   ├── architecture.md
│   ├── alerting.md
│   └── troubleshooting.md
│
├── screenshots/
│   ├── grafana-dashboard-app.png
│   ├── grafana-dashboard-system.png
│   ├── alloy-dashboard.png
│   ├── prometheus-query.png
│   ├── prometheus-targets.png
│   └── slack-alerts.png
│
├── .gitignore
├── README.md
└── LICENSE
```

---

## 🔥 Key Highlights

* VM-based observability (no Docker)
* Grafana Alloy unified pipeline
* Remote-write metrics architecture
* Centralized logging system
* Slack alerting integration
* Infrastructure as Code (Terraform)
* CI/CD pipeline with GitHub Actions

---

## 📈 Future Improvements

* Terraform remote backend (S3 + DynamoDB)
* HTTPS (NGINX + SSL)
* Kubernetes migration
* Distributed tracing (Tempo)

---

## 👨‍💻 Author

**Joseph MJ**
DevOps Engineer | Cloud | Observability

---

## ⭐ Support

If you found this useful, give it a ⭐
