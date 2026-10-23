#!/bin/bash
echo "=== 1. Ativação do KeepAlive ==="

sudo sed -i 's/KeepAlive Off/KeepAlive On/' /etc/httpd/conf/httpd.conf

echo "=== 2. Ativando do mod_deflate ==="

sudo bash -c 'cat > /etc/httpd/conf.d/deflate.conf <<EOF
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript application/json
</IfModule>
EOF'

echo "=== 3. Reiniciando o Apache ==="
sudo systemctl restart httpd

