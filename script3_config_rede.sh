#!/bin/bash
echo "=== 1. Verificando o IP público do servidor ==="
curl -s ifconfig.me
echo -e "\n"

echo "=== 2. Configurando o Firewalld (Portas 22, 80, 443) ==="
sudo systemctl start firewalld
sudo systemctl enable firewalld

sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload



echo "=============================================================================="
echo "Rede e Firewall configuradas com sucesso!"
echo "=============================================================================="
