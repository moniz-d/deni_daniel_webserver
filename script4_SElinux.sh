#!/bin/bash
echo "=== 1. Verificando o estado do SELinux ==="
sestatus

echo "=== 2. Garantindo que o SELinux está em modo Enforcing ==="
sudo setenforce 1
sudo sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config

echo "=== 3. Gerando relatório de auditoria inicial ==="
sudo mkdir -p /var/log/seguranca
sudo sealert -a /var/log/audit/audit.log > /var/log/seguranca/selinux_report.log 2>/dev/null || echo "Aviso: Sem alertas críticos."

echo "=============================================================================="
echo "SELinux verificado e configurado!"
echo "=============================================================================="
