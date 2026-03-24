# 🛠️ Troubleshooting Guide

Common issues and how to resolve them.

---

## ❌ Prometheus Targets DOWN

### Check:

```bash
http://<Prometheus-IP>:9090/targets
```

### Fix:

* Verify Node Exporter:

```bash
systemctl status node
```

* Check firewall:

```bash
ufw status
```

---

## ❌ No Data in Grafana

### Fix:

* Verify data source
* Check Prometheus query:

```promql
up
```

---

## ❌ Logs Not Showing in Grafana

### Check Alloy:

```bash
systemctl status alloy
```

### Verify config:

```bash
cat /etc/alloy/config.alloy
```

### Check Loki:

```bash
curl http://<Loki-IP>:3100/ready
```

---

## ❌ Flask App Not Running

```bash
systemctl status titan
```

Restart:

```bash
systemctl restart titan
```

---

## ❌ Node Exporter Not Running

```bash
systemctl restart node
```

Check:

```bash
curl http://localhost:9100/metrics
```

---

## ❌ Alloy Not Sending Data

* Check logs:

```bash
journalctl -u alloy -f
```

* Validate endpoints:

```bash
PrometheusIP
LokiIP
```

---

## ❌ Slack Alerts Not Working

* Verify webhook URL
* Check Alertmanager logs
* Confirm alert rules firing

---

## 🧪 Debug Commands

```bash
netstat -tulnp
ss -tulnp
curl localhost:9100/metrics
```

---

## 🔥 Pro Tips

* Always check logs first
* Validate ports and connectivity
* Restart services after config changes

---

## ✅ Summary

Most issues come from:

* Incorrect IPs
* Firewall blocking
* Service not running

Fix those first.

