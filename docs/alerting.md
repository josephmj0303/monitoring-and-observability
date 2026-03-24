# 🚨 Alerting Setup (Prometheus + Slack)

This guide explains how to configure alerting using **Prometheus Alertmanager with Slack integration**.

---

## 🧠 Alerting Flow

1. Prometheus evaluates rules
2. Alerts sent to Alertmanager
3. Alertmanager sends notifications to Slack

---

## ⚙️ Step 1: Configure Alert Rules

Example:

```yaml
groups:
- name: system-alerts
  rules:
  - alert: HighCPUUsage
    expr: 100 - (avg by(instance)(irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 80
    for: 2m
    labels:
      severity: critical
    annotations:
      summary: "High CPU usage detected"
```

---

## 📦 Step 2: Setup Alertmanager

Create config:

```yaml
route:
  receiver: 'slack'

receivers:
- name: 'slack'
  slack_configs:
  - api_url: '<SLACK_WEBHOOK_URL>'
    channel: '#alerts'
    title: 'Prometheus Alert'
    text: '{{ range .Alerts }}{{ .Annotations.summary }}{{ end }}'
```

---

## 🔗 Step 3: Get Slack Webhook

1. Go to Slack → Apps → Incoming Webhooks
2. Create webhook
3. Copy URL

---

## 🔁 Step 4: Restart Services

```bash
sudo systemctl restart prometheus
sudo systemctl restart alertmanager
```

---

## 🧪 Step 5: Test Alerts

Trigger load:

```bash
bash scripts/load.sh
```

Check:

* Prometheus → Alerts tab
* Slack channel

---

## ✅ Common Alerts

* High CPU usage
* Memory usage
* App down
* Instance unreachable

---

## 🚀 Best Practices

* Use severity labels
* Group alerts
* Avoid alert spam
* Use meaningful summaries

---

## 🎯 Outcome

You now have **real-time alerting integrated with Slack**.

