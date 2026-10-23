#!/bin/bash
echo "=== 1. Instalação Mod_security para o Apache ==="
sudo dnf install -y mod_security mod_security_crs

echo "=== 2. Ativação do módulo ==="
sudo systemctl restart httpd
echo "Mod_security instalado!"
