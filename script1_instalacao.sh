#!/bin/bash
# ==============================================================================
# Script 1: Instalação Básica do Servidor LAMP (CentOS 10)
# ==============================================================================

echo "=== 1. Atualizando o sistema ==="
sudo dnf update -y

echo "=== 2. Instalando Apache, PHP e MariaDB ==="
sudo dnf install -y httpd mariadb-server php php-mysqlnd

echo "=== 3. Iniciando e ativando os serviços ==="
sudo systemctl start httpd
sudo systemctl enable httpd

sudo systemctl start mariadb
sudo systemctl enable mariadb

echo "=== 4. Criando ficheiro de teste PHP (info.php) ==="
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

echo "=== 5. Verificando se o Apache e o PHP estão a funcionar ==="
curl -I http://localhost/info.php

echo "=============================================================================="
echo "Instalação concluída com sucesso!"
echo "=============================================================================="
