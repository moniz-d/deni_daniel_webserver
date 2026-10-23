#!/bin/bash
echo "=== 1. Verificando logs recentes do sistema e do Apache ==="
sudo tail -n 20 /var/log/httpd/error_log 2>/dev/null || echo "Sem logs de erro do Apache ainda."
sudo tail -n 20 /var/log/secure

echo "=== 2. Sincronizando horário via NTP (Chrony) ==="
sudo dnf install -y chrony
sudo systemctl start chronyd
sudo systemctl enable chronyd
