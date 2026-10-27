#!/bin/bash

sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

echo "-> Ping ao Gateway"
ping -c 2 8.8.8.8

echo "-> Testar Acesso Web Local"
curl -s -I http://localhost | head -n 3

echo "=============================================================================="
echo "Script 3 executado com sucesso! Rede e Firewall configurados."
echo "=============================================================================="
