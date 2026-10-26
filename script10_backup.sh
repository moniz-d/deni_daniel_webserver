#!/bin/bash

sudo dnf update -y
BACKUP_DIR="/backups"
sudo mkdir -p "$BACKUP_DIR"
DATA=$(date +%Y%m%d_%H%M%S)
sudo tar -czf "$BACKUP_DIR/web_backup_$DATA.tar.gz" /var/www/html
sudo mysqldump -u root -p'atec123' --all-databases 2>/dev/null | sudo gzip > "$BACKUP_DIR/db_backup_$DATA.sql.gz" || \
sudo mysqldump -u root --all-databases | sudo gzip > "$BACKUP_DIR/db_backup_$DATA.sql.gz"
echo "=== Ficheiros de Backup criados ==="
ls -lh "$BACKUP_DIR"/*_$DATA.*
SCRIPT_PATH="$(realpath "$0")"
(crontab -l 2>/dev/null | grep -Fq "$SCRIPT_PATH") || \
(crontab -l 2>/dev/null; echo "0 0 * * * /bin/bash $SCRIPT_PATH >/dev/null 2>&1") | crontab -
echo "=============================================================================="
echo "Script 10 executado com sucesso! Atualizações, backups e agendamento concluídos."
echo "=============================================================================="
