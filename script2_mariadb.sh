#!/bin/bash

echo "=== 1. Configuração de segurança no MariaDB ==="

DB_ROOT_PASSWORD="atec123"

sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
FLUSH PRIVILEGES;
EOF

echo "=============================================================================="
echo "MariaDB configurado com sucesso!"
echo "=============================================================================="
