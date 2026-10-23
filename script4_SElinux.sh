#!/bin/bash
echo "=== 1. Verificação do estado do SELinux ==="
sestatus

echo "=== 2. Garantindo que o SELinux está em modo Enforcing ==="
sudo setenforce 1
sudo sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config

echo "=== 3. Relatório de auditoria inicial ==="
sudo mkdir -p /var/log/seguranca.log
sudo sealert -a /var/log/audit/audit.log > /var/log/seguranca.log/selinux_report.log 2>/dev/null || echo "Aviso: Sem alertas críticos."

echo "=============================================================================="
echo "SELinux configurado!"
echo "=============================================================================="
