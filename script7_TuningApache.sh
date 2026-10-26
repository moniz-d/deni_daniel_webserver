#!/bin/bash


sudo sed -i 's/KeepAlive Off/KeepAlive On/' /etc/httpd/conf/httpd.conf 2>/dev/null || true
sudo bash -c 'cat > /etc/httpd/conf.d/tuning.conf <<EOF
KeepAlive On
MaxKeepAliveRequests 100
KeepAliveTimeout 5
MaxRequestWorkers 150
EOF'
sudo bash -c 'cat > /etc/httpd/conf.d/deflate.conf <<EOF
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript application/json
</IfModule>
EOF'
sudo dnf install -y mod_ssl openssl
sudo dnf install -y mod_ssl openssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/pki/tls/private/apache-selfsigned.key \
  -out /etc/pki/tls/certs/apache-selfsigned.crt \
  -subj "/C=PT/ST=Lisboa/L=Lisboa/O=ATEC/OU=Atrás do 20/CN=192.168.217.134" \
  -addext "subjectAltName=IP:192.168.217.134,DNS:localhost" 2>/dev/null || true

  sudo bash -c 'cat > /etc/httpd/conf.d/ssl-site.conf <<EOF
<VirtualHost *:443>
    ServerName localhost
    SSLEngine on
    SSLCertificateFile /etc/pki/tls/certs/apache-selfsigned.crt
    SSLCertificateKeyFile /etc/pki/tls/private/apache-selfsigned.key
    DocumentRoot /var/www/html
</VirtualHost>
EOF'
sudo systemctl restart httpd

echo "=============================================================================="
echo "Script 7 executado com sucesso! Apache otimizado."
echo "=============================================================================="
