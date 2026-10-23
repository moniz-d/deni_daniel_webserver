#!/bin/bash
echo "=== 1. Configurações do Apache ==="

sudo sed -i 's/KeepAlive Off/KeepAlive On/' /etc/httpd/conf/httpd.conf

echo "=== 2. Ativando e configurando o mod_deflate ==="

sudo bash -c 'cat > /etc/httpd/conf.d/deflate.conf <<EOF
<IfModule mod_deflate.c>
    # Comprimir ficheiros de texto, HTML, CSS, JavaScript e XML
    AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript application/json
</IfModule>
EOF'

echo "=== 3. Reininiciar o Apache ==="
sudo systemctl restart httpd 
sudo systemctl enable httpd
