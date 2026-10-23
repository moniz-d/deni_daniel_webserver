#!/bin/bash

sestatus
sudo setenforce 1
sudo sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config
sudo mkdir -p /var/log/seguranca.log
sudo dnf install -y setroubleshoot-server 2>/dev/null || true
sudo sealert -a /var/log/audit/audit.log > /var/log/seguranca.log/selinux_report.log 2>/dev/null || echo "Relatório inicial criado em /var/log/seguranca.log/selinux_report.log"
echo "=============================================================================="
echo "Script 4 executado com sucesso! SELinux configurado em Enforcing."
echo "=============================================================================="
