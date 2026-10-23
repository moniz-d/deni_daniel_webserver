#!/bin/bash

echo "-> Erros do Apache:"
sudo tail -n 5 /var/log/httpd/error_log 2>/dev/null || echo "Sem erros registados."
echo "-> Acessos SSH/Segurança:"
sudo tail -n 5 /var/log/secure
FALHAS=$(grep -i "failed" /var/log/secure 2>/dev/null | wc -l)
echo "Tentativas de acesso falhadas detetadas: $FALHAS"
sudo dnf install -y chrony
sudo systemctl enable --now chronyd

echo "=============================================================================="
echo "Script 11 executado com sucesso! Monitorização e NTP configurados."
echo "=============================================================================="
