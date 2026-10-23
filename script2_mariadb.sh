#!/bin/bash

DB_ROOT_PASSWORD="atec123"

sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
FLUSH PRIVILEGES;
EOF

echo "=============================================================================="
echo "Script 2 executado com sucesso! MariaDB seguro e configurado."
echo "=============================================================================="
