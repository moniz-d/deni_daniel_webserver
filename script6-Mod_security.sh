#!/bin/bash
echo "=== 1. Instalando Mod_security para o Apache ==="
sudo dnf install -y mod_security mod_security_crs

echo "=== 2. Ativando o módulo e reiniciando o Apache ==="
sudo systemctl restart httpd
echo "Mod_security instalado e ativo com regras base!"
