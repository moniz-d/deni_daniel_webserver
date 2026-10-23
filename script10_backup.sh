#!/bin/bash
echo "=== 1. Atualizando pacotes do sistema ==="
sudo dnf update -y

echo "=== 2. Criando diretório de backup ==="
sudo mkdir -p /backups

echo "=== 3. Compactando o site e bases de dados ==="
BACKUP_FILE="/backups/backup_$(date +%Y%m%d).tar.gz"
sudo tar -czf $BACKUP_FILE /var/www/html
echo "Backup criado em: $BACKUP_FILE"
