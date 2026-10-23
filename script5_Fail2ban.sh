#!/bin/bash


sudo dnf install -y epel-release
sudo dnf install -y fail2ban fail2ban-systemd
sudo bash -c 'cat > /etc/fail2ban/jail.local <<EOF
[DEFAULT]
bantime  = 600
findtime = 600
maxretry = 3
destemail = grsc@atec.com
sender = grsc@atec.pt
action = %(action_mwl)s

[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
backend = systemd

[apache-auth]
enabled = true
port    = http,https
logpath = %(apache_error_log)s

[apache-noscript]
enabled = true
port    = http,https
logpath = %(apache_error_log)s
EOF'


sudo systemctl restart fail2ban
sudo systemctl enable fail2ban
sudo fail2ban-client status

echo "=============================================================================="
echo "Script 5 executado com sucesso! Fail2ban ativo para SSH e Apache."
echo "=============================================================================="
