#!/bin/bash


TOTAL_RAM_MB=$(free -m | awk '/^Mem:/{print $2}')
BUFFER_POOL_MB=$((TOTAL_RAM_MB * 60 / 100))

sudo bash -c "cat > /etc/my.cnf.d/tuning.cnf <<EOF
[mysqld]
innodb_buffer_pool_size = ${BUFFER_POOL_MB}M
innodb_log_file_size = 256M
max_connections = 100
EOF"
sudo systemctl restart mariadb
echo "=============================================================================="
echo "Script 8 executado com sucesso! MariaDB otimizado."
echo "=============================================================================="
