#!/bin/bash
# ==============================================================================
# Script 2: Configuração Segura do MariaDB
# ==============================================================================

echo "=== 1. Aplicando configurações de segurança no MariaDB ==="

# Define a password de root para a base de dados (podes alterar 'sua_senha_aqui' se quiseres)
DB_ROOT_PASSWORD="atec123"

sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
FLUSH PRIVILEGES;
EOF

echo "=============================================================================="
echo "MariaDB configurado com segurança com sucesso!"
echo "=============================================================================="
