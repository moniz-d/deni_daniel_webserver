#!/bin/bash

echo "=== 1. Atualizando o sistema ==="
sudo dnf update -y

echo "=== 2. Instalação: Apache, PHP e MariaDB ==="
sudo dnf install -y httpd mariadb-server php php-mysqlnd

echo "=== 3. Ativação de serviços ==="
sudo systemctl start httpd
sudo systemctl enable httpd

sudo systemctl start mariadb
sudo systemctl enable mariadb

echo "=== 4. Criação do ficheiro info.php ==="
sudo bash -c 'cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Projeto - CentOS 10</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; background-color: #f4f4f9; color: #333; }
        h1 { color: #0066cc; }
        .card { background: white; padding: 30px; border-radius: 8px; display: inline-block; box-shadow: 0 0 15px rgba(0,0,0,0.1); }
        .aviso { color: #d9534f; font-weight: bold; font-size: 1.2em; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="card">
        <h1>A Bombar!!!!!</h1>
        <p>Projeto de Automação em CentOS 10.</p>
        <p class="aviso">Nós não queremos chumbar!!!!!</p>
    </div>
</body>
</html>
EOF'
echo "=============================================================================="
echo "Instalação concluída com sucesso!"
echo "=============================================================================="
