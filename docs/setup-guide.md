# 🚀 Setup Guide

This guide walks through setting up the complete **Monitoring & Observability Platform** on EC2 instances.

---

## 🧱 Infrastructure Overview

| Component   | Instance       |
| ----------- | -------------- |
| Application | App EC2        |
| Prometheus  | Prometheus EC2 |
| Grafana     | Grafana EC2    |
| Loki        | Loki EC2       |

---

## ⚙️ Prerequisites

* Ubuntu 22.04 / CentOS
* Minimum 2 GB RAM per instance
* Open ports:

  * 22 (SSH)
  * 3000 (Grafana)
  * 9090 (Prometheus)
  * 3100 (Loki)
  * 9100 (Node Exporter)
  * 5000 (Flask App)

---

## 🖥️ Step 1: Setup Application Node

```bash
chmod +x scripts/webnode_setup.sh
sudo ./scripts/webnode_setup.sh
```

This installs:

* Node Exporter
* Flask App (systemd)
* Grafana Alloy
* Load generators

---

## 📊 Step 2: Setup Prometheus Server

```bash
chmod +x observability/prometheus/prometheus-setup.sh
sudo ./observability/prometheus/prometheus-setup.sh
```

Verify:

```bash
http://<Prometheus-IP>:9090
```

---

## 📈 Step 3: Setup Grafana

```bash
chmod +x observability/grafana/grafana-setup.sh
sudo ./observability/grafana/grafana-setup.sh
```

Access:

```bash
http://<Grafana-IP>:3000
```

Default credentials:

* admin / admin

---

## 📜 Step 4: Setup Loki

```bash
chmod +x observability/loki/lokisetup.sh
sudo ./observability/loki/lokisetup.sh
```

---

## 🔁 Step 5: Configure Alloy (IMPORTANT)

Edit:

```bash
sudo nano /etc/alloy/config.alloy
```

Update:

```hcl
url = "http://<Prometheus-IP>:9090/api/v1/write"
url = "http://<Loki-IP>:3100/loki/api/v1/push"
```

Restart:

```bash
sudo systemctl restart alloy
```

---

## 🔍 Step 6: Verify Setup

### Prometheus Targets

* Go to: `Status → Targets`
* Ensure all targets are **UP**

### Grafana

* Add data sources:

  * Prometheus → `http://<Prometheus-IP>:9090`
  * Loki → `http://<Loki-IP>:3100`

---

## 🧪 Step 7: Generate Load

```bash
bash scripts/load.sh
bash scripts/generate_multi_logs.sh
```

---

## ✅ Final Validation Checklist

* [ ] Node Exporter running (9100)
* [ ] Flask app running (5000)
* [ ] Prometheus targets UP
* [ ] Logs visible in Grafana
* [ ] Dashboards populated
* [ ] Alerts configured

---

## 🎉 Done!

Your monitoring stack is now fully operational.

