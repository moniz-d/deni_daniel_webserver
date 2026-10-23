#!/bin/bash
echo "=== 1. Otimizando configurações do Apache ==="
# Ativando KeepAlive de forma simples
sudo sed -i 's/KeepAlive Off/KeepAlive On/' /etc/httpd/conf/httpd.conf

echo "=== 2. Reiniciando o Apache ==="
sudo systemctl restart httpd
