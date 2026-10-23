#!/bin/bash
echo "=== 1. Instalação: Fail2ban ==="
sudo dnf install -y epel-release
sudo dnf install -y fail2ban

echo "=== 2. Configuração básica para o SSH ==="
sudo bash -c 'cat > /etc/fail2ban/jail.local <<EOF
[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
maxretry = 3
bantime = 600
EOF'

echo "=== 3. Ativação do serviço Fail2ban ==="
sudo systemctl start fail2ban
sudo systemctl enable fail2ban

echo "=============================================================================="
echo "Fail2ban instalado e ativo para o SSH!"
echo "=============================================================================="
