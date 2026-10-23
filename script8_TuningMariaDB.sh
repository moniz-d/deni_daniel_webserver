#!/bin/bash
echo "=== 1. Aplicando ajustes básicos no my.cnf ==="
MY_CNF="/etc/my.cnf"

sudo bash -c "cat >> $MY_CNF <<EOF

[mysqld]
innodb_buffer_pool_size = 256M
max_connections = 100
query_cache_size = 32M
EOF"

echo "=== 2. Reiniciando o MariaDB ==="
sudo systemctl restart mariadb
